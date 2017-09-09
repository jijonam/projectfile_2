package dao;

import java.util.List;
import java.util.Map;

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

	public LectureCartVo selectOne(Map map) {
		LectureCartVo vo = null;
		
		vo = sqlSession.selectOne("lecture_cart_list_one", map);
		
		return vo;
	}

	public int insert(Map map) {
		int res = 0;
		
		res = sqlSession.insert("lecture_cart_list_insert", map);
		
		return res;
	}

	public int delete(Map map) {
		int res = 0;
		
		res = sqlSession.insert("lecture_cart_list_delete", map);
		
		return res;
	}

}
