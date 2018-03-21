package vo;

import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class Movie {
	private int no, audienceNum, genre; // 주키, 관객수, 장르번호
	private String name, director, fmtReleaseDate, fmtAudienceNum; // 영화명, 감독, 개봉일 포맷, 관객수 포맷
	private Date releaseDate, endDate; // 개봉일, 끝난 날짜
	private SimpleDateFormat sdf;

	
	public String getFmtAudienceNum() {
		return fmtAudienceNum;
	}

	public void setFmtAudienceNum(String fmtAudienceNum) {
		this.fmtAudienceNum = fmtAudienceNum;
	}

	public String getFmtReleaseDate() {
		return fmtReleaseDate;
	}

	public void setFmtReleaseDate(String fmtReleaseDate) {
		this.fmtReleaseDate = fmtReleaseDate;
	}


	
	public Movie() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getAudienceNum() {
		return audienceNum;
	}

	public void setAudienceNum(int audienceNum) {
		this.audienceNum = audienceNum;
		//관객수 포맷
		fmtAudienceNum = String.format("%,d", audienceNum);//천단위로 끊어서 숫자 출력
	}

	public int getGenre() {
		return genre;
	}

	public void setGenre(int genre) {
		this.genre = genre;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
		//날짜 포맷 변경 
		sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		fmtReleaseDate = sdf.format(releaseDate);
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
}
