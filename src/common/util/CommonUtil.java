package common.util;

public class CommonUtil {
	
	public static String getPageBar(int totalContents, int cpage, int numPerPage, String url) {
		String pageBar = "";
		
		int pageBarSize = 5;
		int totalPage = (int)Math.ceil((double)totalContents / numPerPage);

		url = url + (url.indexOf("?") > -1 ? "&" : "?") + "cpage=";
		
		int pageStart = ((cpage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageStart + pageBarSize - 1;
		
		int pageNo = pageStart;
		
		
		//draw
		pageBar += "<div class='row'>";
		pageBar += "<div class='col-md-12 py-4'>";
		pageBar += "<ul class='pagination justify-content-center'>";
		
		//이전 영역
		if(pageNo == 1) {
			
		}
		else {
			pageBar += "<li class='page-item'><a class='page-link' href='"+ url + (pageNo - 1) +"'>이전</a></li>";
		}

		
		//페이지 No 영역
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			//현재페이지인 경우, 링크비활성화
			if(pageNo == cpage) {
				pageBar += "<li class='page-item active'><a class='page-link'>"+ pageNo +"</a></li>";
			}
			else {
				pageBar += "<li class='page-item'><a class='page-link' href='" + url + pageNo + "'>"+ pageNo +"</a></li>";
			}
			pageNo++;
		}
		//다음 영역
		if(pageNo > totalPage) {
			
		}
		else {
			pageBar += "<li class='page-item'><a class='page-link' href='"+ url + (pageNo - 1) +"''>다음</a></li>";
			
		}
		
		pageBar += "</ul></div></div>";
		
		return pageBar;
	}


}
