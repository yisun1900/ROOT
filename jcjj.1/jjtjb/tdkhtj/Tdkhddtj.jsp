<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ls_sql=null;
String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String wheresql="";
String dwbhsql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}

String all=null;
String tslxbm=null;
String tslxmc=null;
String tsxlbm=null;
String tsxlmc=null;
String tsyymc=null;

String gysmc=null;
String tspp=null;

int[] mark={3,3,1,2,4};//������ʾ������
//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
int allwjjtssl=0;
int allyjjtssl=0;
int allwjjbxsl=0;
int allyjjbxsl=0;
int temp2=0;
int dltssl=0;
int temp1=0;
String bgcolor="#E8E8FF";

try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
</CENTER>
<br>
    <div align="center"><b>���񡢼Ҿ��˵��ͻ���ϸ</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
<tr bgcolor="#CCCCCC"  align="center">
 
  <td  width="7%">�ͻ�����</td>
  <td  width="7%">�ͻ����</td>
  <td  width="7%">����</td>
  <td  width="7%">������Ŀ</td>
  <td  width="7%">ȷ���˵�����</td>
  <td  width="7%">�˵�ԭ��</td>
  <td  width="7%">���ʦ</td>
  <td  width="7%">�Ǽ�����</td>
  <td  width="7%">��Ŀ����ʵ���</td>
  <td  width="7%">�ظ�����</td>
	<td  width="7%">��ע</td>
</tr>
<%
	Hashtable spanColHash=null;


	ls_sql="select khxm,khbh,dwmc,lx,tdsj,jctdyymc,sjs,lrsj,ychsqk,hfqq ,tdsm from ";
	ls_sql+="( ";
	
	ls_sql+=" SELECT crm_khxx.khxm khxm,crm_khxx.khbh,dwmc,'�Ҿ�' as lx,jc_jjdd.tdsj,jctdyymc,jc_jjdd.jjsjs sjs,jc_jjdd.lrsj,jc_jjdd.ychsqk,'' hfqq, jc_jjdd.tdsm from jc_jjdd,crm_khxx,sq_dwxx,jdm_jctdyybm where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and jc_jjdd.jctdyybm=jdm_jctdyybm.jctdyybm(+) and zt='2' and jc_jjdd.clzt='99' ";
	ls_sql+="  and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=wheresql;
	ls_sql+=" union all ";
	ls_sql+=" SELECT crm_khxx.khxm khxm,crm_khxx.khbh khbh,dwmc,'����' as lx,tdsj,jctdyymc,cgsjs sjs,jc_cgdd.lrsj,'qq' ychsqk,'' hfqq,tdsm from jc_cgdd,crm_khxx,jdm_jctdyybm,sq_dwxx where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and jc_cgdd.jctdyybm=jdm_jctdyybm.jctdyybm(+) and zt='2' and jc_cgdd.clzt='99' ";
	ls_sql+="and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ls_sql+=" ) ";
	ls_sql+=" order by lx";

	//out.print(ls_sql);
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[2]="align='center'";//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("lx","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>

</table>

<%
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 
</table>
</body>
</html>
