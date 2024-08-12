<%@page import="model.BEAN.THELOAI"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Sách Mới</title>
</head>
<body>
    <%
        ArrayList<THELOAI> listTheloai = (ArrayList<THELOAI>) request.getAttribute("listTheloai");
    %>
    <form action="CONTROLLER_ADMIN?modpost=themsach" method="POST" enctype="multipart/form-data">
        <table>
            <tr>
                <td><p>MÃ SÁCH</p></td>
                <td><input type="text" name="masach" required></td>
            </tr>
            <tr>
                <td><p>TÊN SÁCH</p></td>
                <td><input type="text" name="tensach" required></td>
            </tr>
            <tr>
                <td><p>TÁC GIẢ</p></td>
                <td><input type="text" name="tacgia" required></td>
            </tr>
            <tr>
                <td><p>NXB</p></td>
                <td><input type="text" name="nxb" required></td>
            </tr>
            <tr>
                <td><p>THỂ LOẠI</p></td>
                <td>
                    <select class="ccb-timkiem" id="idtheloai" name="idtheloai">
                        <% for (int i = 0; i < listTheloai.size(); i++) { %>
                            <option class="btn-wrap" value="<%= listTheloai.get(i).getIdtheloai() %>"><%= listTheloai.get(i).getTentheloai() %></option>
                        <% } %>
                    </select>
                </td>
            </tr>
            <tr>
                <td><p>GIÁ BÁN</p></td>
                <td><input type="text" name="giaban" required></td>
            </tr>
            <tr>
                <td><p>SỐ LƯỢNG TỔNG</p></td>
                <td><input type="text" name="soluongtong" required></td>
            </tr>
            <tr>
                <td><p>GIẢM GIÁ</p></td>
                <td><input type="text" name="giamgia" required></td>
            </tr>
            <tr>
                <td><p>MÔ TẢ</p></td>
                <td><input type="text" name="mota" required></td>
            </tr>
            <tr>
                <td><p>ẢNH</p></td>
                <td><input type="file" name="fileanh" id="fileanh" accept="image/*" required></td>
            </tr>
            
            <tr>
                <td></td>
                <td colspan="2">
                    <input type="submit" value="Lưu lại">
                    <button><a href="../Controller/C_QLNSPB.jsp?updateView=1" style="text-decoration: none;color:black">Hủy</a></button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
