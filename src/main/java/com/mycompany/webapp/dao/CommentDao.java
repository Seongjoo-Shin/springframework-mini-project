package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CommentDao {
	
	public int countComment(int freebno);

}
