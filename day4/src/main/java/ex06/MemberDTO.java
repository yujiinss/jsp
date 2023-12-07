package ex06;

public class MemberDTO {
	
	private String name;
	private String imgPath;
	
	public MemberDTO() {} 
	// 매개변수를 전달받지 않는 기본생성자가 있어야 useBean을 사용할 수 있다
	
	
	public MemberDTO(String name, String imgPath) {
		this.name = name;
		this.imgPath ="image/"+ name +".png";
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
		this.imgPath="image/"+name+".png";
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
}
