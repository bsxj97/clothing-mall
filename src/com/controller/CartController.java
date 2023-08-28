package com.controller;

import javax.annotation.Resource;
import javax.mail.Session;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dao.*;
import com.entity.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Saveobject;

import java.util.*;

@Controller
public class CartController extends BaseController {
	@Resource
	CartDAO cartDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	ProductDAO productDAO;
	@Resource
	CategoryDAO categoryDAO;
	@Resource
	Saveobject saveobject;
	@Resource
	OrdermsgDAO ordermsgDAO;
	
	

	// 查询购车商品
	@RequestMapping("cartList")
	public String cartList(HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute(
				"sessionmember");
		    //double zk = saveobject.getzk(member.getId());
			HashMap map = new HashMap();
			map.put("memberid", member.getId());
			List<Cart> cartlist = cartDAO.selectAll(map);
			String totalstr = "";
			double total = 0.0;
			for(Cart cart:cartlist){
				Member m = memberDAO.findById(cart.getMemberid());
				Product product = productDAO.findById(cart.getProductid());
				cart.setMember(m);
				cart.setProduct(product);
				double sjprice = 0D;
				double doublesubtotal = 0D;
				if(product.getTprice()>0){
					sjprice = product.getTprice();
					total += Double.parseDouble(String.valueOf(cart.getNum()))* sjprice;
					doublesubtotal = Double.parseDouble(String.valueOf(cart.getNum()))*sjprice;
				}else{
					sjprice = product.getPrice();
					total += Double.parseDouble(String.valueOf(cart.getNum()))* sjprice;
					doublesubtotal = Double.parseDouble(String.valueOf(cart.getNum()))*sjprice;
				}
				cart.setSubtotal(String.format("%.2f", doublesubtotal));
			}
			totalstr = String.format("%.2f", total);
			request.setAttribute("totaldoubel", Double.parseDouble(totalstr));
			request.setAttribute("cartlist", cartlist);
			request.setAttribute("totalstr", totalstr);
		    saveobject.getCategoryObject(request);
		    String suc = request.getParameter("suc")==null?"":request.getParameter("suc");
		    if(!suc.equals("")){
		    	request.setAttribute("suc", "创建成功");
		    }
		    
		    HashMap mmm = new HashMap();
		    mmm.put("goodstype", "购买商品");
		    saveobject.hotSales("", request);
		return "cartlist";
	}

	// 添加购物车
	@RequestMapping("addCart")
	public void addCart(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			Member member = (Member) request.getSession().getAttribute(
					"sessionmember");
			if (member != null) {
				String productid = request.getParameter("productid");
				String num = request.getParameter("num");
				//判断是否是购买自己的商品
				Product product = (Product)productDAO.findById(Integer.parseInt(productid));
				HashMap map = new HashMap();
				map.put("memberid", member.getId());
				map.put("productid", productid);
				List<Cart> list = cartDAO.selectAll(map);
				if (list.size() == 0) {
					Cart cart = new Cart();
					cart.setMemberid(member.getId());
					cart.setProductid(Integer.parseInt(productid));
					cart.setNum(Integer.parseInt(num));
					cart.setShopid(Integer.valueOf(product.getSaver()));
					cartDAO.add(cart);
				} else {
					Cart ct = new Cart();
					ct.setId(list.get(0).getId());
					ct.setNum(list.get(0).getNum() + Integer.parseInt(num));
					cartDAO.update(ct);
				}
				
				out.print("1");
			} else {
				out.println("0");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 删除购物车中的商品
	@RequestMapping("delCart")
	public void delCart(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			String id = request.getParameter("id");
			cartDAO.delCart(Integer.parseInt(id));
			out.println("0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//修改购物车
	@RequestMapping("updateNum")
	public void updateNum(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			String id = request.getParameter("id");
			String num = request.getParameter("num");
			Cart ct = new Cart();
			ct.setId(Integer.parseInt(id));
			ct.setNum(Integer.parseInt(num));
			cartDAO.updateNum(ct);
			out.println("0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	
	//清空购物车
	@RequestMapping("carDel")
	public void carDel(HttpServletRequest request,HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			Member member = (Member)request.getSession().getAttribute("sessionmember");
			if(member!=null){
				HashMap map = new HashMap();
				map.put("memberid", member.getId());
				List<Cart> list =  cartDAO.selectAll(map);
				for(Cart cart:list){
					cartDAO.delCart(cart.getId());
				}
				out.println("1");
			}else{
				out.println("0");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
