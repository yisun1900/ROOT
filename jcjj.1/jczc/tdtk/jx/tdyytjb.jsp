<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String txlx=cf.GB2Uni(request.getParameter("txlx"));

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����ԭ����� 
  <BR>(<%=sjfw%>--<%=sjfw2%>)</font></B> 
  <BR>
</CENTER>
<table border="0" width="100%" style='FONT-SIZE: 14px'>
  <tr align="center">
    <td colspan="3">
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="28%">����ԭ�� </td>
          <td  width="12%">��������</td>
          <td  width="20%">ʵ�˽�Ԫ�� </td>
          <td  width="25%">�ٷֱ�(%)</td>
        </tr>
        <%
		//�����ʾ����
		
		int[] mark={3,2,2,4};//������ʾ������
		//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ

		ls_sql="SELECT sum(zjje)";
		ls_sql+=" FROM crm_zjxdj,crm_khxx ";
		ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh and crm_zjxdj.fssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zjxdj.fssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}

		String tdje=cf.executeQuery(ls_sql);

		
		ls_sql="SELECT zjxyymc,count(*),sum(zjje),'<img src=\"/images/ColuGif.gif\" width='||ABS(sum(zjje))*130/"+tdje+"||' height=14>&nbsp;'";
		ls_sql+=" FROM crm_zjxdj,crm_khxx,dm_zjxyybm ";
		ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh and crm_zjxdj.zjxyybm=dm_zjxyybm.zjxyybm ";
		ls_sql+=" and crm_zjxdj.fssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zjxdj.fssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ls_sql+=" group by zjxyymc";

		ls_sql+=" order by zjxyymc";
		
		
		so.addData(ls_sql);

		//�������
		so.outData(out,mark);
%> 
      </table>
    </td>
  </tr>
</table>
</body>
</html>
