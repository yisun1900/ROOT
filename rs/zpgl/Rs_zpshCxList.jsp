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
	String shbh=null;
	String zpsqbh=null;
	String shjl=null;
	String shr=null;
	String shsj=null;
	String shhrs=null;
	String ztbm=null;

	shbh=request.getParameter("shbh");
	if (shbh!=null)
	{
		shbh=shbh.trim();
		if (!(shbh.equals("")))	wheresql+=" and (rs_zpsh.shbh="+shbh+") ";
	}
	zpsqbh=request.getParameter("zpsqbh");
	if (zpsqbh!=null)
	{
		zpsqbh=cf.GB2Uni(zpsqbh);
		if (!(zpsqbh.equals("")))	wheresql+=" and  (rs_zpsh.zpsqbh='"+zpsqbh+"')";
	}
	ztbm=request.getParameter("ztbm");
	if (ztbm!=null)
	{
		ztbm=cf.GB2Uni(ztbm);
		if (!(ztbm.equals("")))	wheresql+=" and  (rs_zpsh.ztbm='"+ztbm+"')";
	}
	shjl=request.getParameter("shjl");
	if (shjl!=null)
	{
		shjl=cf.GB2Uni(shjl);
		if (!(shjl.equals("")))	wheresql+=" and  (rs_zpsh.shjl='"+shjl+"')";
	}
	shhrs=request.getParameter("shhrs");
	if (shhrs!=null)
	{
		shhrs=cf.GB2Uni(shhrs);
		if (!(shhrs.equals("")))	wheresql+=" and  (rs_zpsq.shhrs='"+shhrs+"')";
	}
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (rs_zpsh.shr='"+shr+"')";
	}
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (rs_zpsh.shsj>=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (rs_zpsh.shsj<=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT rs_zpsh.shbh shbh,rs_zpsh.zpsqbh zpsqbh,rs_ztbm.ztmc ztbm,DECODE(rs_zpsh.shjl,'0','ȡ������','1','���ͨ��')  shjl,rs_zpsh.shr shr,rs_zpsh.shsj shsj,rs_zpsh.shyj shyj ";
	ls_sql+=" FROM rs_zpsh,rs_zpsq,rs_ztbm  ";
    ls_sql+=" where  rs_zpsq.zpsqbh=rs_zpsh.zpsqbh and rs_zpsq.sqzt!='05' and rs_ztbm.ztbm=rs_zpsh.yztbm";
    ls_sql+=wheresql;
	ls_sql+=" order by shbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_zpshCxList.jsp","SelectCxRs_zpsh.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"shbh","zpsqbh","shjl","shyj","shr","shsj","yztbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zpsqbh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"zpsqbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewRs_zpsq.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zpsqbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
/*	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
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
	<td  width="8%">��˱��</td>
	<td  width="11%">��Ƹ������</td>
	<td  width="22	%">���״̬</td>
	<td  width="10%">��˽���</td>
	<td  width="10%">�����</td>
	<td  width="10%">���ʱ��</td>
	<td  width="25%">������</td>
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