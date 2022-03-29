package kr.spring.admin.dao;

import java.util.List;
import java.util.Map;

import kr.spring.member.vo.MemberVO;
import kr.spring.reserve.vo.ReserveVO;

public interface AdminMapper {
	
	//회원리스트 카운트
	public int selectMemberRowCount(Map<String,Object> map);
	
	//관리자 회원관리리스트
	public List<MemberVO> selectList(MemberVO map);
	
	//관리자 회원정보 수정
	public MemberVO adminUpdateMember(MemberVO member);
	
	// 관리자 예매내역 카운트
	public int selectAdminReserveMovieListCount(Map<String, Object> map);

	// 관리자 예매내역 리스트
	public List<ReserveVO> selectAdminReserveMovieList(Map<String, Object> map);

}
