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
	String blxhbm=null;
	String blxh=null;
	String jg=null;
	String bllxbm=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_blbj.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_blbj.dqbm='"+dqbm+"')";

	bllxbm=request.getParameter("bllxbm");
	if (bllxbm!=null)
	{
		if (!(bllxbm.equals("")))	wheresql+=" and  (jc_blbj.bllxbm='"+bllxbm+"')";
	}
	String blytbm=null;
	blytbm=request.getParameter("blytbm");
	if (blytbm!=null)
	{
		if (!(blytbm.equals("")))	wheresql+=" and  (jc_blbj.blytbm='"+blytbm+"')";
	}
	blxhbm=request.getParameter("blxhbm");
	if (blxhbm!=null)
	{
		blxhbm=cf.GB2Uni(blxhbm);
		if (!(blxhbm.equals("")))	wheresql+=" and  (blxhbm='"+blxhbm+"')";
	}
	blxh=request.getParameter("blxh");
	if (blxh!=null)
	{
		blxh=cf.GB2Uni(blxh);
		if (!(blxh.equals("")))	wheresql+=" and  (blxh='"+blxh+"')";
	}
	jg=request.getParameter("jg");
	if (jg!=null)
	{
		jg=jg.trim();
		if (!(jg.equals("")))	wheresql+=" and  (jg="+jg+") ";
	}
	ls_sql="SELECT blxhbm,blxh,bllxmc,blyt,jg,'<IMG SRC=\"/jcjj/bl/images/'||UPPER(zp)||'\" height=100>' zp,jc_blbj.bz,jc_blbj.lrr,jc_blbj.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jc_blbj,jdm_bllxbm,jdm_blytbm,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_blbj.bllxbm=jdm_bllxbm.bllxbm(+) and jc_blbj.blytbm=jdm_blytbm.blytbm(+)";
    ls_sql+=" and jc_blbj.dqbm=dm_dqbm.dqbm(+) and jc_blbj.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_blbj.dqbm,blxhbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_blbjCxList.jsp","SelectCxJc_blbj.jsp","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"blxhbm","blxh","jg","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"blxhbm"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
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
	<td  width="6%">�����ͺű���</td>
	<td  width="14%">��������</td>
	<td  width="9%">��������</td>
	<td  width="9%">������;</td>
	<td  width="7%">�۸�</td>
	<td  width="12%">��Ƭ</td>
	<td  width="16%">��ע</td>
	<td  width="6%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="9%">¼�벿��</td>
	<td  width="5%">��������</td>
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