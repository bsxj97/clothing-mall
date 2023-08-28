package com.dao;
import com.entity.*;
import java.util.*;
public interface WlrecordDAO {
	List<Wlrecord> selectAll(HashMap map);
	void add(Wlrecord wlrecord);
}
