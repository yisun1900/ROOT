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
	String sq_yhsqrz_xh=null;
	String sq_yhsqrz_ip=null;
	String sq_yhsqrz_lrrdlm=null;
	String sq_yhsqrz_lrrxm=null;
	String sq_yhsqrz_lrsj=null;
	String sq_yhsqrz_yhdlm=null;
	String sq_yhsqrz_czlx=null;
	sq_yhsqrz_xh=request.getParameter("sq_yhsqrz_xh");
	if (sq_yhsqrz_xh!=null)
	{
		sq_yhsqrz_xh=sq_yhsqrz_xh.trim();
		if (!(sq_yhsqrz_xh.equals("")))	wheresql+=" and (sq_yhsqrz.xh="+sq_yhsqrz_xh+") ";
	}
	sq_yhsqrz_ip=request.getParameter("sq_yhsqrz_ip");
	if (sq_yhsqrz_ip!=null)
	{
		sq_yhsqrz_ip=cf.GB2Uni(sq_yhsqrz_ip);
		if (!(sq_yhsqrz_ip.equals("")))	wheresql+=" and  (sq_yhsqrz.ip='"+sq_yhsqrz_ip+"')";
	}
	sq_yhsqrz_lrrdlm=request.getParameter("sq_yhsqrz_lrrdlm");
	if (sq_yhsqrz_lrrdlm!=null)
	{
		sq_yhsqrz_lrrdlm=cf.GB2Uni(sq_yhsqrz_lrrdlm);
		if (!(sq_yhsqrz_lrrdlm.equals("")))	wheresql+=" and  (sq_yhsqrz.lrrdlm='"+sq_yhsqrz_lrrdlm+"')";
	}
	sq_yhsqrz_lrrxm=request.getParameter("sq_yhsqrz_lrrxm");
	if (sq_yhsqrz_lrrxm!=null)
	{
		sq_yhsqrz_lrrxm=cf.GB2Uni(sq_yhsqrz_lrrxm);
		if (!(sq_yhsqrz_lrrxm.equals("")))	wheresql+=" and  (sq_yhsqrz.lrrxm='"+sq_yhsqrz_lrrxm+"')";
	}
	sq_yhsqrz_lrsj=request.getParameter("sq_yhsqrz_lrsj");
	if (sq_yhsqrz_lrsj!=null)
	{
		sq_yhsqrz_lrsj=sq_yhsqrz_lrsj.trim();
		if (!(sq_yhsqrz_lrsj.equals("")))	wheresql+="  and (sq_yhsqrz.lrsj>=TO_DATE('"+sq_yhsqrz_lrsj+"','YYYY/MM/DD'))";
	}
	sq_yhsqrz_lrsj=request.getParameter("sq_yhsqrz_lrsj2");
	if (sq_yhsqrz_lrsj!=null)
	{
		sq_yhsqrz_lrsj=sq_yhsqrz_lrsj.trim();
		if (!(sq_yhsqrz_lrsj.equals("")))	wheresql+="  and (sq_yhsqrz.lrsj<=TO_DATE('"+sq_yhsqrz_lrsj+"','YYYY/MM/DD'))";
	}
	sq_yhsqrz_yhdlm=request.getParameter("sq_yhsqrz_yhdlm");
	if (sq_yhsqrz_yhdlm!=null)
	{
		sq_yhsqrz_yhdlm=cf.GB2Uni(sq_yhsqrz_yhdlm);
		if (!(sq_yhsqrz_yhdlm.equals("")))	wheresql+=" and  (sq_yhsqrz.yhdlm='"+sq_yhsqrz_yhdlm+"')";
	}
	sq_yhsqrz_czlx=request.getParameter("sq_yhsqrz_czlx");
	if (sq_yhsqrz_czlx!=null)
	{
		sq_yhsqrz_czlx=cf.GB2Uni(sq_yhsqrz_czlx);
		if (!(sq_yhsqrz_czlx.equals("")))	wheresql+=" and  (sq_yhsqrz.czlx='"+sq_yhsqrz_czlx+"')";
	}
	ls_sql="SELECT sq_yhsqrz.xh,sq_yhsqrz.ip,sq_yhsqrz.lrrdlm,sq_yhsqrz.lrrxm,sq_yhsqrz.lrsj,sq_yhsqrz.yhdlm,sq_yhsqrz.yhmc,sq_yhsqrz.yhzbh, DECODE(sq_yhsqrz.czlx,'1','����','2','ɾ��','3','�޸�'),sq_yhz.yhzmc,sq_yhsqrz.bz  ";
	ls_sql+=" FROM sq_yhsqrz,sq_yhz  ";
    ls_sql+=" where sq_yhsqrz.yhzbh =sq_yhz.yhzbh (+)";
    ls_sql+=wheresql;
    ls_sql+=" order by xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_yhsqrzCxList.jsp","SelectCxSq_yhsqrz.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","sq_yhsqrz_ip","sq_yhsqrz_lrrdlm","sq_yhsqrz_lrrxm","sq_yhsqrz_lrsj","sq_yhsqrz_yhdlm","sq_yhsqrz_yhzbh","sq_yhsqrz_czlx","sq_yhsqrz_bz","sq_yhz_yhzmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">���</td>
	<td  width="10%">¼����IP��ַ</td>
	<td  width="8%">¼���˵�½��</td>
	<td  width="8%">¼��������</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="10%">���������û���½��</td>
	<td  width="10%">�û�����</td>
	<td  width="10%">���������û���</td>
	<td  width="6%">��������</td>
	<td  width="10%">���������û���</td>
	<td  width="12%">��ע</td>
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