<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String kp_yzfdzpdcs_ssfgs=null;
	String kp_yzfdzpdcs_pjde=null;
	String kp_yzfdzpdcs_grs=null;
	String kp_yzfdzpdcs_zbj=null;
	String kp_yzfdzpdcs_khmyd=null;
	String kp_yzfdzpdcs_zxzsgds=null;
	String kp_yzfdzpdcs_zdzsgds=null;
	kp_yzfdzpdcs_ssfgs=request.getParameter("kp_yzfdzpdcs_ssfgs");
	if (kp_yzfdzpdcs_ssfgs!=null)
	{
		kp_yzfdzpdcs_ssfgs=cf.GB2Uni(kp_yzfdzpdcs_ssfgs);
		if (!(kp_yzfdzpdcs_ssfgs.equals("")))	wheresql+=" and  (kp_yzfdzpdcs.ssfgs='"+kp_yzfdzpdcs_ssfgs+"')";
	}
	kp_yzfdzpdcs_pjde=request.getParameter("kp_yzfdzpdcs_pjde");
	if (kp_yzfdzpdcs_pjde!=null)
	{
		kp_yzfdzpdcs_pjde=kp_yzfdzpdcs_pjde.trim();
		if (!(kp_yzfdzpdcs_pjde.equals("")))	wheresql+=" and  (kp_yzfdzpdcs.pjde="+kp_yzfdzpdcs_pjde+") ";
	}
	kp_yzfdzpdcs_grs=request.getParameter("kp_yzfdzpdcs_grs");
	if (kp_yzfdzpdcs_grs!=null)
	{
		kp_yzfdzpdcs_grs=kp_yzfdzpdcs_grs.trim();
		if (!(kp_yzfdzpdcs_grs.equals("")))	wheresql+=" and (kp_yzfdzpdcs.grs="+kp_yzfdzpdcs_grs+") ";
	}
	kp_yzfdzpdcs_zbj=request.getParameter("kp_yzfdzpdcs_zbj");
	if (kp_yzfdzpdcs_zbj!=null)
	{
		kp_yzfdzpdcs_zbj=kp_yzfdzpdcs_zbj.trim();
		if (!(kp_yzfdzpdcs_zbj.equals("")))	wheresql+=" and  (kp_yzfdzpdcs.zbj="+kp_yzfdzpdcs_zbj+") ";
	}
	kp_yzfdzpdcs_khmyd=request.getParameter("kp_yzfdzpdcs_khmyd");
	if (kp_yzfdzpdcs_khmyd!=null)
	{
		kp_yzfdzpdcs_khmyd=kp_yzfdzpdcs_khmyd.trim();
		if (!(kp_yzfdzpdcs_khmyd.equals("")))	wheresql+=" and  (kp_yzfdzpdcs.khmyd="+kp_yzfdzpdcs_khmyd+") ";
	}
	kp_yzfdzpdcs_zxzsgds=request.getParameter("kp_yzfdzpdcs_zxzsgds");
	if (kp_yzfdzpdcs_zxzsgds!=null)
	{
		kp_yzfdzpdcs_zxzsgds=kp_yzfdzpdcs_zxzsgds.trim();
		if (!(kp_yzfdzpdcs_zxzsgds.equals("")))	wheresql+=" and (kp_yzfdzpdcs.zxzsgds="+kp_yzfdzpdcs_zxzsgds+") ";
	}
	kp_yzfdzpdcs_zdzsgds=request.getParameter("kp_yzfdzpdcs_zdzsgds");
	if (kp_yzfdzpdcs_zdzsgds!=null)
	{
		kp_yzfdzpdcs_zdzsgds=kp_yzfdzpdcs_zdzsgds.trim();
		if (!(kp_yzfdzpdcs_zdzsgds.equals("")))	wheresql+=" and (kp_yzfdzpdcs.zdzsgds="+kp_yzfdzpdcs_zdzsgds+") ";
	}
	ls_sql="SELECT sq_dwxx.dwmc,kp_yzfdzpdcs.pjde,kp_yzfdzpdcs.grs,kp_yzfdzpdcs.zbj,kp_yzfdzpdcs.khmyd,kp_yzfdzpdcs.zxzsgds,kp_yzfdzpdcs.zdzsgds  ";
	ls_sql+=" FROM kp_yzfdzpdcs,sq_dwxx  ";
    ls_sql+=" where kp_yzfdzpdcs.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_yzfdzpdcs.ssfgs";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_yzfdzpdcsCxList.jsp","SelectCxKp_yzfdzpdcs.jsp","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="18%">�ֹ�˾</td>
	<td  width="17%">��һ��ȵ�ƽ������</td>
	<td  width="12%">���鹤����Сֵ</td>
	<td  width="17%">�ʱ�����Сֵ</td>
	<td  width="12%">�ͻ��������Сֵ</td>
	<td  width="12%">������С��ʩ������</td>
	<td  width="12%">���������ʩ������</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>