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
	String jc_mmxhb_mmxh=null;
	String jc_mmxhb_mxbm=null;
	String jc_mmxhb_mytbm=null;
	String jc_mmxhb_zp=null;
	String jc_mmxhb_bz=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_mmxhb.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_mmxhb.dqbm='"+dqbm+"')";

	String bzjg=null;
	bzjg=request.getParameter("bzjg");
	if (bzjg!=null)
	{
		if (!(bzjg.equals("")))	wheresql+=" and  (jc_mmxhb.bzjg>="+bzjg+")";
	}
	bzjg=request.getParameter("bzjg2");
	if (bzjg!=null)
	{
		if (!(bzjg.equals("")))	wheresql+=" and  (jc_mmxhb.bzjg<="+bzjg+")";
	}
	  
   	jc_mmxhb_mmxh=request.getParameter("jc_mmxhb_mmxh");
	if (jc_mmxhb_mmxh!=null)
	{
		jc_mmxhb_mmxh=cf.GB2Uni(jc_mmxhb_mmxh);
		if (!(jc_mmxhb_mmxh.equals("")))	wheresql+=" and  (jc_mmxhb.mmxh='"+jc_mmxhb_mmxh+"')";
	}
	jc_mmxhb_mxbm=request.getParameter("jc_mmxhb_mxbm");
	if (jc_mmxhb_mxbm!=null)
	{
		jc_mmxhb_mxbm=cf.GB2Uni(jc_mmxhb_mxbm);
		if (!(jc_mmxhb_mxbm.equals("")))	wheresql+=" and  (jc_mmxhb.mxbm='"+jc_mmxhb_mxbm+"')";
	}
	jc_mmxhb_mytbm=request.getParameter("jc_mmxhb_mytbm");
	if (jc_mmxhb_mytbm!=null)
	{
		jc_mmxhb_mytbm=cf.GB2Uni(jc_mmxhb_mytbm);
		if (!(jc_mmxhb_mytbm.equals("")))	wheresql+=" and  (jc_mmxhb.mytbm='"+jc_mmxhb_mytbm+"')";
	}
	jc_mmxhb_zp=request.getParameter("jc_mmxhb_zp");
	if (jc_mmxhb_zp!=null)
	{
		jc_mmxhb_zp=cf.GB2Uni(jc_mmxhb_zp);
		if (!(jc_mmxhb_zp.equals("")))	wheresql+=" and  (jc_mmxhb.zp='"+jc_mmxhb_zp+"')";
	}
	jc_mmxhb_bz=request.getParameter("jc_mmxhb_bz");
	if (jc_mmxhb_bz!=null)
	{
		jc_mmxhb_bz=cf.GB2Uni(jc_mmxhb_bz);
		if (!(jc_mmxhb_bz.equals("")))	wheresql+=" and  (jc_mmxhb.bz='"+jc_mmxhb_bz+"')";
	}
	ls_sql="SELECT jc_mmxhb.mmxh,jdm_mxbm.mxmc,jdm_mytbm.myt,bzjg,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=200>' zp,jc_mmxhb.bz,jc_mmxhb.lrr,jc_mmxhb.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jc_mmxhb,jdm_mytbm,jdm_mxbm,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_mmxhb.mytbm=jdm_mytbm.mytbm(+) and jc_mmxhb.mxbm=jdm_mxbm.mxbm(+)";
    ls_sql+=" and jc_mmxhb.dqbm=dm_dqbm.dqbm(+) and jc_mmxhb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mmxhb.dqbm,jc_mmxhb.mmxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mmxhbCxList.jsp","SelectCxJc_mmxhb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"mmxh","jdm_mxbm_mxmc","jdm_mytbm_msylxmc","jc_mmxhb_zp","jc_mmxhb_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"mmxh"};
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
	<td  width="8%">ľ���ͺ�</td>
	<td  width="13%">����</td>
	<td  width="8%">����;</td>
	<td  width="8%">��׼�۸�</td>
	<td  width="13%">��Ƭ</td>
	<td  width="16%">��ע</td>
	<td  width="7%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="12%">¼�벿��</td>
	<td  width="7%">��������</td>
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