<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String spks=null;
String spzl=null;
String spgn=null;
String spfw=null;
String azjs=null;
String fwtd=null;
String fwgf=null;
String mfsh=null;
String mfaz=null;
String zssm=null;
String syxt=null;
String sydb=null;
String wzzq=null;
String qlxc=null;
String cscp=null;
String jsbyzs=null;
String bzgkjxy=null;
String bzgkjcf=null;
String bsdtt=null;
String bjsgkxf=null;
String bsygksb=null;
String bjsgkyq=null;
String azhs=null;
String bz=null;
String whereyddbh=null;
whereyddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,spks,spzl,spgn,spfw,azjs,fwtd,fwgf,mfsh,mfaz,zssm,syxt,sydb,wzzq,qlxc,cscp,jsbyzs,bzgkjxy,bzgkjcf,bsdtt,bjsgkxf,bsygksb,bjsgkyq,azhs,bz ";
	ls_sql+=" from  jc_mmazfkd";
	ls_sql+=" where (1=1) and  (yddbh='"+whereyddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		spks=cf.fillNull(rs.getString("spks"));
		spzl=cf.fillNull(rs.getString("spzl"));
		spgn=cf.fillNull(rs.getString("spgn"));
		spfw=cf.fillNull(rs.getString("spfw"));
		azjs=cf.fillNull(rs.getString("azjs"));
		fwtd=cf.fillNull(rs.getString("fwtd"));
		fwgf=cf.fillNull(rs.getString("fwgf"));
		mfsh=cf.fillNull(rs.getString("mfsh"));
		mfaz=cf.fillNull(rs.getString("mfaz"));
		zssm=cf.fillNull(rs.getString("zssm"));
		syxt=cf.fillNull(rs.getString("syxt"));
		sydb=cf.fillNull(rs.getString("sydb"));
		wzzq=cf.fillNull(rs.getString("wzzq"));
		qlxc=cf.fillNull(rs.getString("qlxc"));
		cscp=cf.fillNull(rs.getString("cscp"));
		jsbyzs=cf.fillNull(rs.getString("jsbyzs"));
		bzgkjxy=cf.fillNull(rs.getString("bzgkjxy"));
		bzgkjcf=cf.fillNull(rs.getString("bzgkjcf"));
		bsdtt=cf.fillNull(rs.getString("bsdtt"));
		bjsgkxf=cf.fillNull(rs.getString("bjsgkxf"));
		bsygksb=cf.fillNull(rs.getString("bsygksb"));
		bjsgkyq=cf.fillNull(rs.getString("bjsgkyq"));
		azhs=cf.fillNull(rs.getString("azhs"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ľ�Ű�װ������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">Ԥ�������</div>
            </td>
            <td width="29%"> <%=yddbh%> </td>
            <td width="21%"> 
              <div align="right">��Ʒ��ʽ</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+������&2+����&3+������",spks,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">��Ʒ����</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+������&2+����&3+������",spzl,true);
%> </td>
            <td width="21%"> 
              <div align="right">��Ʒ����</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+������&2+����&3+������",spgn,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">��Ʒ����</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+������&2+����&3+������",spfw,true);
%> </td>
            <td width="21%"> 
              <div align="right">��װ����</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+������&2+����&3+������",azjs,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">����̬��</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+������&2+����&3+������",fwtd,true);
%> </td>
            <td width="21%"> 
              <div align="right">����淶</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+������&2+����&3+������",fwgf,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">����ͻ�</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",mfsh,true);
%> </td>
            <td width="21%"> 
              <div align="right">��Ѱ�װ</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",mfaz,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">׼ʱ����</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",zssm,true);
%> </td>
            <td width="21%"> 
              <div align="right">ʹ��Ь��</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",syxt,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">ʹ�õ沼</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",sydb,true);
%> </td>
            <td width="21%"> 
              <div align="right">λ����ȷ</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",wzzq,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">�����ֳ�</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",qlxc,true);
%> </td>
            <td width="21%"> 
              <div align="right">���ò�Ʒ</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",cscp,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">���ܱ���֪ʶ</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",jsbyzs,true);
%> </td>
            <td width="21%"> 
              <div align="right">���ڹ˿ͼ�����</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",bzgkjxy,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">���ڹ˿ͼҳԷ�</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",bzgkjcf,true);
%> </td>
            <td width="21%"> 
              <div align="right">�������̵</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",bsdtt,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">�����ܹ˿�С��</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",bjsgkxf,true);
%> </td>
            <td width="21%"> 
              <div align="right">��ʹ�ù˿ͼ�ˮ��</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",bsygksb,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">�����ܹ˿�����</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",bjsgkyq,true);
%> </td>
            <td width="21%"> 
              <div align="right">��װ��ʱ</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+��&N+��",azhs,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%" align="right">��ע</td>
            <td colspan="3"><%=bz%></td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
