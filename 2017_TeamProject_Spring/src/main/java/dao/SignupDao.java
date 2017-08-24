package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.SignupVo;

public class SignupDao {
	
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<SignupVo> selectList() {
		// TODO Auto-generated method stub
		List<SignupVo> list = null;
		
		list = sqlSession.selectList("signup_list");
		
		return list;
	}

	public List<SignupVo> selectList(Map map) {
		// TODO Auto-generated method stub
		List<SignupVo> list = null;
		
		list = sqlSession.selectList("signup_list_condition", map);
		
		return list;
	}
	
	

}
