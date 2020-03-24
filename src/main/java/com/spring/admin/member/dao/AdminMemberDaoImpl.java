package com.spring.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.spring.client.member.vo.MemberVO;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.selectList("memberList");
	}
	
	@Override
	public Map<String, Integer> memberAgeList() {
		// TODO Auto-generated method stub
		return session.selectMap("mamberAgeList", "");
	}

	@Override
	public Map<String, Integer> memberGenderList() {
		// TODO Auto-generated method stub
		return session.selectMap("memberGenderList", "");
	}

	

}
