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

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�����˵���ϸ <BR>
  (<%=sjfw%>--<%=sjfw2%>)</B> 
  <BR> 
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td> 
	<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="10%">ǩ������</td>
          <td  width="6%">�ͻ����</td>
          <td  width="6%">�ͻ�����</td>
          <td  width="6%">ʩ����</td>
          <td  width="6%">���ʦ</td>
          <td  width="6%">�ʼ�</td>
          <td  width="9%">�˵�ʱ��</td>
          <td  width="8%">ʵ�˽��</td>
          <td  width="13%">ԭ�����</td>
          <td  width="20%">�˵�ԭ��˵��</td>
          <td  width="10%">��ע</td>
        </tr>
<%	
	int[] mark={3,1,1,1,1,1,1,2,4,4,4};//������ʾ������
	//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ

	ls_sql="SELECT a.dwmc zd,'<A HREF=\"/khxx/ViewCrm_khxx.jsp?khbh='||khbh||'\" target=\"_blank\">'||khbh||'</A>' as khbh,khxm,sgdmc sgd,sjs,zjxm,lrsj,crm_tddj.stje,tdyymc,tdyysm,crm_tddj.bz  ";
	ls_sql+=" FROM crm_tddj,dm_tdyybm,sq_dwxx a,sq_sgd";
    ls_sql+=" where crm_tddj.tdyybm=dm_tdyybm.tdyybm and crm_tddj.sgd=sq_sgd.sgd(+) and crm_tddj.dwbh=a.dwbh(+)";
	ls_sql+=" and crm_tddj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tddj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_tddj.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_tddj.dwbh='"+dwbh+"'";
	}

	ls_sql+=" order by zd,tdyymc";

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
