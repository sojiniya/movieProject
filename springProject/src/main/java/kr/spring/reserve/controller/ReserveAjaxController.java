package kr.spring.reserve.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.reserve.service.ReserveService;
import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.vo.TimeVO;


@Controller
public class ReserveAjaxController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReserveAjaxController.class);
	
	@Autowired
	private ReserveService reserveService;
	
	//선택한 영화 목록
	@RequestMapping("/reserve/pickmovie.do")
	@ResponseBody
	public Map<String,Object> pickmoviedetail(@RequestParam(value="movie_num") int movie_num){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		
		MovieVO movie = reserveService.pickmoviedetail(movie_num);
		List<TheaterVO> theater_local_name = null;
		theater_local_name = reserveService.pickmoviedetail_get_theater_local(movie_num);
		List<Integer> theater_local_count = null;
		theater_local_count = reserveService.pickmoviedetail_get_theater_localcount(movie_num);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("movie", movie);
		mapJson.put("theater_local_name",theater_local_name);
		mapJson.put("theater_local_count",theater_local_count);
		
		return mapJson;
	}
	
	//영화 선택 후 극장 지역(서울/인천...)선택 시 지역별 CGV 목록
	@RequestMapping("/reserve/picklocal.do")
	@ResponseBody
	public Map<String,Object> picklocaldetail(@RequestParam(value="pick_localname") String theater_local,@RequestParam(value="pick_movie_num") Integer movie_num){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		logger.info("<<전달받은 CGV 지역>> theater_local : " + theater_local);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movie_num",movie_num);
		map.put("theater_local",theater_local);
		
		List<TheaterVO> cgv_list = null;
		cgv_list = reserveService.pickmoviedetail_get_theater_cgv(map);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("cgv_list", cgv_list);
		
		return mapJson;
	}
	
	//cgv 선택
	@RequestMapping("/reserve/pickcgv.do")
	@ResponseBody
	public Map<String,Object> pickcgvdetail(@RequestParam(value="pick_theaternum") Integer theater_num,@RequestParam(value="pick_movie_num") Integer movie_num){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		logger.info("<<전달받은 상영관 번호>> theater_num : " + theater_num);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movie_num", movie_num);
		map.put("theater_num", theater_num);
				
		List<TimeVO> date_list = null;
		date_list = reserveService.pickmoviedetail_get_date(map);
		System.out.println("상영일자 조회 결과 : " + date_list);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("date_list", date_list);
		
		return mapJson;
	}
	
	//상영시간 선택
	@RequestMapping("/reserve/picktime.do")
	@ResponseBody
	public Map<String,Object> picktimedetail(@RequestParam(value="pick_theaternum") Integer theater_num,
											 @RequestParam(value="pick_movie_num") Integer movie_num,
											 @RequestParam(value="pick_moviedate") String movie_date){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		logger.info("<<전달받은 상영관 번호>> theater_num : " + theater_num);
		logger.info("<<전달받은 상영일자>> movie_date : " + movie_date);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movie_num", movie_num);
		map.put("theater_num", theater_num);
		map.put("movie_date", movie_date);
				
		List<TimeVO> time_list = null;
		time_list = reserveService.pickmoviedetail_get_time(map);
		System.out.println("메서드 실행후(time_list) : " + time_list);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("time_list", time_list);
		
		return mapJson;
	}
	
	//카카오 페이 결제
	@RequestMapping("/reserve/kakaopay.do")
	public String kakaopay() {
		System.out.println("=====================우선 실행=====================");
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection server = (HttpURLConnection)url.openConnection(); // 내 서버와 카카오 서버를 연결해주는 클래스
			server.setRequestMethod("POST"); // 서버 요청방식 지정
			server.setRequestProperty("Authorization", "KakaoAK 03cdd82183bad1979f6f057009b87197");
			server.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			server.setDoOutput(true); // setDoOutput()은 기본값이 false기 때문에 true로 명시해줘야함 setDoInput()은 기본값이 true라 생략 가능.
			String parameter ="cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=http://localhost:8080/project/reserve/reserveconfirm.do&fail_url=http://localhost:8080/project/reserve/reserveconfirm.do&cancel_url=http://localhost:8080/project/reserve/reserveconfirm.do";
			OutputStream out = server.getOutputStream(); // 무언가(?) 주는애
			DataOutputStream dataout = new DataOutputStream(out); // 데이터 주는애
			dataout.writeBytes(parameter); // 파라미터는 바이트형식으로 형변환해서 서버에 전달해줘야함.
			dataout.close(); // dataout.flush() 처리(dataout이 가지고 있는 data를 서버에 전달해줌) 완료 후 dataout 닫기
			
			int result = server.getResponseCode(); // 서버통신 결과를 담는 변수
			
			System.out.println("[서버통신 결과] : " + result);
			
			InputStream in; // 무언가(?) 받는애
			if(result == 200) { // http 통신 정상은 200 그 외에는 무조건 다 error
				in = server.getInputStream();
			}else { // 에러나는 경우
				in = server.getErrorStream();
			}
			
			InputStreamReader reader = new InputStreamReader(in); // InputStream 으로 받은걸 읽기 위해서 InputStreamReader 객체 생성
			BufferedReader br = new BufferedReader(reader); // InputStreamReader 로 읽은 데이터를 형변환
			//System.out.println("리드라인 : " + br.readLine());
			return br.readLine();
			
		} catch (MalformedURLException e) { // URL 클래스 예외처리
			e.printStackTrace();
		} catch (IOException e) { // openConnection() 예외처리
			e.printStackTrace();
		}
		
		
		return "{\"result\":\"NO\"}";
	}
	
}
