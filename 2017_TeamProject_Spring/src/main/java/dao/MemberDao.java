package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVo;

public class MemberDao {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<MemberVo> selectList() {
		List<MemberVo> list = null;
		//1.ÀÛ¾÷°´Ã¼ È¹µæ
		list  = sqlSession.selectList("member_list");

		return list;
	}

	public MemberVo selectOne(String email){
		// TODO Auto-generated method stub
		MemberVo vo = null;
		//2.ÀÛ¾÷
		vo = sqlSession.selectOne("member_one", email);

		return vo;
	}

	public int insert(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;

		//2.ÀÛ¾÷
		res = sqlSession.insert("member_insert",vo);

		return res;
	}

}
