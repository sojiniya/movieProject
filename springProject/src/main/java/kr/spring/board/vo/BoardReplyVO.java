package kr.spring.board.vo;

import java.sql.Date;

public class BoardReplyVO {
	private int reply_num;
	private String re_content;
	private Date re_date;
	private int board_num;//부모 글번호
	private int mem_num;//작성자 회원번호
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	@Override
	public String toString() {
		return "BoardReplyVO [reply_num=" + reply_num + ", re_content=" + re_content + ", re_date=" + re_date
				+ ", board_num=" + board_num + ", mem_num=" + mem_num + "]";
	}
}