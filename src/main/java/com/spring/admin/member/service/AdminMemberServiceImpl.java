package com.spring.admin.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.admin.member.dao.AdminMemberDao;

@Service
@Transactional
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private AdminMemberDao adminMemberDao;

	@Override
	public List<MemberVO> memberList(MemberVO bvo) {
		// TODO Auto-generated method stub
		List<MemberVO> mList = null;
		mList = adminMemberDao.memberList(mvo);
		return mList;
	}
	
	@Override
	public Map<String, Integer> memberAgeList() {
		// TODO Auto-generated method stub
		Map<String, Integer> ageList = null;
		ageList = adminMemberDao.memberAgeList();
		return ageList;
	}

	@Override
	public Map<String, Integer> memberGenderList() {
		// TODO Auto-generated method stub
		Map<String, Integer> genderList = null;
		genderList = adminMemberDao.memberGenderList();
		return genderList;
	}

	

}
