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
	String call_init_bjhm=null;
	String call_init_mac=null;
	String call_init_yhbm=null;
	String call_init_ssfgs=null;
	String call_init_lywjml=null;
	String call_init_lrr=null;
	String call_init_lrsj=null;
	String call_init_lrbm=null;
	call_init_bjhm=request.getParameter("call_init_bjhm");
	if (call_init_bjhm!=null)
	{
		call_init_bjhm=cf.GB2Uni(call_init_bjhm);
		if (!(call_init_bjhm.equals("")))	wheresql+=" and  (call_init.bjhm='"+call_init_bjhm+"')";
	}
	call_init_mac=request.getParameter("call_init_mac");
	if (call_init_mac!=null)
	{
		call_init_mac=cf.GB2Uni(call_init_mac);
		if (!(call_init_mac.equals("")))	wheresql+=" and  (call_init.mac='"+call_init_mac+"')";
	}
	call_init_yhbm=request.getParameter("call_init_yhbm");
	if (call_init_yhbm!=null)
	{
		call_init_yhbm=cf.GB2Uni(call_init_yhbm);
		if (!(call_init_yhbm.equals("")))	wheresql+=" and  (call_init.yhbm='"+call_init_yhbm+"')";
	}
	call_init_ssfgs=request.getParameter("call_init_ssfgs");
	if (call_init_ssfgs!=null)
	{
		call_init_ssfgs=cf.GB2Uni(call_init_ssfgs);
		if (!(call_init_ssfgs.equals("")))	wheresql+=" and  (call_init.ssfgs='"+call_init_ssfgs+"')";
	}
	call_init_lywjml=request.getParameter("call_init_lywjml");
	if (call_init_lywjml!=null)
	{
		call_init_lywjml=cf.GB2Uni(call_init_lywjml);
		if (!(call_init_lywjml.equals("")))	wheresql+=" and  (call_init.lywjml='"+call_init_lywjml+"')";
	}
	call_init_lrr=request.getParameter("call_init_lrr");
	if (call_init_lrr!=null)
	{
		call_init_lrr=cf.GB2Uni(call_init_lrr);
		if (!(call_init_lrr.equals("")))	wheresql+=" and  (call_init.lrr='"+call_init_lrr+"')";
	}
	call_init_lrsj=request.getParameter("call_init_lrsj");
	if (call_init_lrsj!=null)
	{
		call_init_lrsj=call_init_lrsj.trim();
		if (!(call_init_lrsj.equals("")))	wheresql+="  and (call_init.lrsj=TO_DATE('"+call_init_lrsj+"','YYYY/MM/DD'))";
	}
	call_init_lrbm=request.getParameter("call_init_lrbm");
	if (call_init_lrbm!=null)
	{
		call_init_lrbm=cf.GB2Uni(call_init_lrbm);
		if (!(call_init_lrbm.equals("")))	wheresql+=" and  (call_init.lrbm='"+call_init_lrbm+"')";
	}
	ls_sql="SELECT call_init.bjhm,call_init.mac,call_init.yhbm,a.dwmc fgs,call_init.lywjml,call_init.lrr,call_init.lrsj,b.dwmc lrbm  ";
	ls_sql+=" FROM call_init,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where call_init.ssfgs=a.dwbh and call_init.lrbm=b.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by call_init.ssfgs,call_init.bjhm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Call_initCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"bjhm","call_init_mac","call_init_yhbm","sq_dwxx_dwmc","call_init_lywjml","call_init_lrr","call_init_lrsj","call_init_lrbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"bjhm"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
	<td  width="11%">��������</td>
	<td  width="15%">Mac��ַ</td>
	<td  width="15%">�û�����</td>
	<td  width="11%">�����ֹ�˾</td>
	<td  width="15%">¼���ļ�Ŀ¼</td>
	<td  width="6%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="11%">¼�벿��</td>
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