package com.itwillbs.domain;

import java.util.List;

public class PageDTO {
	// DB 쿼리문 입력 멤버변수
	private int pageSize; // 화면에 보여줄 글의 개수
	private int startRow; // 테이블에서 가져올 시작 글번호
	private int endRow; // 시작 글번호에서 가져올 글 개수
	private String search; // 페이지 검색어
	private String product_dv; // 품목 구분
	
	// 페이징처리 계산 멤버변수
	private String pageNum; // 현재 화면의 페이지번호 String
	private int CurrentPage; // 현재 화면의 페이지번호 int(형변환)
	private int pageBlock; // 한 화면에 나타낼 페이징 개수
	private int pageCount; // 총 페이징 개수
	private int startPage; // 페이징 시작 번호
	private int endPage; // 페이징 끝 번호
	private int count; // 게시판의 모든 행 개수
	private int cprCount; // 게시판의 완제품 행 개수 
	
	// 테이블 병합처리 멤버변수
	private List<Integer> rowcolsTd; // td의 rowcols 수 
	private List<Integer> showTd; // td를 나타낼 위치
			
	public List<Integer> getRowcolsTd() {
		return rowcolsTd;
	}
	public void setRowcolsTd(List<Integer> rowcolsTd) {
		this.rowcolsTd = rowcolsTd;
	}
	public List<Integer> getShowTd() {
		return showTd;
	}
	public void setShowTd(List<Integer> showTd) {
		this.showTd = showTd;
	}
	public int getCprCount() {
		return cprCount;
	}
	public void setCprCount(int cprCount) {
		this.cprCount = cprCount;
	}
	public String getProduct_dv() {
		return product_dv;
	}
	public void setProduct_dv(String product_dv) {
		this.product_dv = product_dv;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getCurrentPage() {
		return CurrentPage;
	}
	public void setCurrentPage(int currentPage) {
		CurrentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
}//class
