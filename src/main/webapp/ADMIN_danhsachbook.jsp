<%@page import="model.BEAN.SACH"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
        request.setCharacterEncoding("UTF-8");
        ArrayList<SACH> listBook = (ArrayList<SACH>) request.getAttribute("listBook");
    %>
    <a href="CONTROLLER_ADMIN?modget=themsach">Thêm sách</a>
    <br>
    <br>
    <table border="1">
            <thead>
                <tr>
                    <th>Tên Sách</th>
                    <th>Tác Giả</th>
                    <th>Thể Loại</th>
                    <th>Giá Bán</th>
                    <th>Số Lượng Tổng</th>
                    <th>Số Lượng Còn Lại</th>
                    <th>Giảm Giá</th>
                    <th>Mô Tả</th>
                    <th>Ảnh</th>
					<th>Cập Nhập</th>
					<th>Xóa</th>
                </tr>
            </thead>
            <tbody> 
                <% for (int i = 0; i < listBook.size(); i++) { %>
                    <tr>
                        <td><%= listBook.get(i).getTenSach() %></td>
                        <td><%= listBook.get(i).getTacGia() %></td>
                        <td><%= listBook.get(i).getTenTheLoai() %></td>
                        <td><%= listBook.get(i).getGiaBan() %></td>
                        <td><%= listBook.get(i).getSoLuongTong() %></td>
                         <td><%= listBook.get(i).getSoLuongConLai() %></td>
                        <td><%= listBook.get(i).getGiamGia() %></td>
                        <td><%= listBook.get(i).getMoTa() %></td>
                        
                    	<td>
						    <img src="image_book/<%= listBook.get(i).getTenAnh() %>"
						         style="width: 200px; height: 200px;"
						         alt="" />
						</td>

                    	<td><a href="CONTROLLER_USER?modget=xem&masach=<%=listBook.get(i).getMaSach()%>">Cập Nhập</a></td>
                    	<td><a href="CONTROLLER_USER?modget=xem&masach=<%=listBook.get(i).getMaSach()%>">Xóa</a></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
</body>
</html>