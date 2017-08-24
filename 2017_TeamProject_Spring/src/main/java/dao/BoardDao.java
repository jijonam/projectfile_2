package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVo;

public class BoardDao {

	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//전체목록조회
	public List<BoardVo> selectList(){
		
		List<BoardVo> list = null;
		//1.작업객체 획득
		list  = sqlSession.selectList("board_list");
		
		return list;
	}
	
	//Page + 검색조건별
	public List<BoardVo> selectList(Map map) {
		// TODO Auto-generated method stub
		List<BoardVo> list = null;
		//2.수행
		list  = sqlSession.selectList("board_condition_list",map);
		
		return list;
	}
	

	public int insert(BoardVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		//2.작업
		res = sqlSession.insert("board_insert",vo);
		
		return res;
	}

	public BoardVo selectOne(int idx) {
		// TODO Auto-generated method stub
		BoardVo vo = null;
		//2.작업
		vo = sqlSession.selectOne("board_one", idx);
		
		return vo;
	}

	public int update_readhit(int idx) {
		// TODO Auto-generated method stub
		int res = 0;
		
		//2.작업
		res = sqlSession.update("board_readhit", idx);

		return res;
	}

	public int update_step(BoardVo baseVo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		//2.작업
		res = sqlSession.update("board_step", baseVo);
		
		return res;
	}

	public int reply(BoardVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		//2.작업
		res = sqlSession.insert("board_reply",vo);
		
		return res;
	}

	public int delete(int idx) {
		// TODO Auto-generated method stub
		int res = 0;
		
		//2.작업
		res = sqlSession.delete("board_delete", idx);
		
		return res;
	}

	public int update(BoardVo vo) {
		// TODO Auto-generated method stub
    	int res = 0;
    	
		res = sqlSession.update("board_update",vo);

    	return res;
	}

	public int selectRowTotal(Map map) {
		// TODO Auto-generated method stub
		int total=0;

		total = sqlSession.selectOne("board_row_total", map);
		
		return total;
	}


	
	
	
	
	
}
