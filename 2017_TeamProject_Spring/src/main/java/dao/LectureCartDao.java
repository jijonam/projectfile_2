package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.LectureCartVo;

public class LectureCartDao {
	
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<LectureCartVo> selectList(int idx) {
		// TODO Auto-generated method stub
		List<LectureCartVo> list = null;
		
		list = sqlSession.selectList("lecture_cart_list", idx);
		
		return list;		
		
	}

}
