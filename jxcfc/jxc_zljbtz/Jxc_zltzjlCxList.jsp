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
	String tzph=null;
	String dqbm=null;
	String ckbh=null;
	String tzr=null;
	String tzrq=null;
	String ssfgs=null;
	String ssbm=null;
	String bz=null;
	tzph=request.getParameter("tzph");
	if (tzph!=null)
	{
		tzph=tzph.trim();
		if (!(tzph.equals("")))	wheresql+=" and (jxc_zltzjl.tzph="+tzph+") ";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_zltzjl.dqbm='"+dqbm+"')";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (jxc_zltzjl.ckbh='"+ckbh+"')";
	}
	tzr=request.getParameter("tzr");
	if (tzr!=null)
	{
		tzr=cf.GB2Uni(tzr);
		if (!(tzr.equals("")))	wheresql+=" and  (jxc_zltzjl.tzr='"+tzr+"')";
	}
	tzrq=request.getParameter("tzrq");
	if (tzrq!=null)
	{
		tzrq=tzrq.trim();
		if (!(tzrq.equals("")))	wheresql+="  and (jxc_zltzjl.tzrq>=TO_DATE('"+tzrq+"','YYYY/MM/DD'))";
	}
	tzrq=request.getParameter("tzrq2");
	if (tzrq!=null)
	{
		tzrq=tzrq.trim();
		if (!(tzrq.equals("")))	wheresql+="  and (jxc_zltzjl.tzrq<=TO_DATE('"+tzrq+"','YYYY/MM/DD'))";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (jxc_zltzjl.ssfgs='"+ssfgs+"')";
	}
	ssbm=request.getParameter("ssbm");
	if (ssbm!=null)
	{
		ssbm=cf.GB2Uni(ssbm);
		if (!(ssbm.equals("")))	wheresql+=" and  (jxc_zltzjl.ssbm='"+ssbm+"')";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (jxc_zltzjl.bz like '%"+bz+"%')";
	}
	ls_sql="SELECT tzph,dqmc,ckmc,tzr,tzrq,a.dwmc ssfgs,b.dwmc ssbm,jxc_zltzjl.bz  ";
	ls_sql+=" FROM jxc_zltzjl,jxc_ckmc,sq_dwxx a,sq_dwxx b,dm_dqbm ";
    ls_sql+=" where jxc_zltzjl.ckbh=jxc_ckmc.ckbh and jxc_zltzjl.ssfgs=a.dwbh and jxc_zltzjl.ssbm=b.dwbh and jxc_zltzjl.dqbm=dm_dqbm.dqbm ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_zltzjlCxList.jsp","SelectCxJxc_zltzjl.jsp","ViewJxc_zltzjl.jsp","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"tzph","dqbm","ckbh","tzr","tzrq","ssfgs","ssbm","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"tzph"};
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
	<td  width="6%">&nbsp;</td>
	<td  width="3%">����</td>
	<td  width="11%">����</td>
	<td  width="11%">�ֿ�</td>
	<td  width="8%">������</td>
	<td  width="11%">��������</td>
	<td  width="11%">�ֹ�˾</td>
	<td  width="11%">��������</td>
	<td  width="15%">��ע</td>
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