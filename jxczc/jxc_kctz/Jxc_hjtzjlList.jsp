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
	String ckbh=null;
	String lrr=null;
	String lrsj=null;
	String ssfgs=null;
	String clzt=null;

	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=clzt.trim();
		if (!(clzt.equals("")))	wheresql+=" and (jxc_hjtzjl.clzt='"+clzt+"') ";
	}
	tzph=request.getParameter("tzph");
	if (tzph!=null)
	{
		tzph=tzph.trim();
		if (!(tzph.equals("")))	wheresql+=" and (jxc_hjtzjl.tzph='"+tzph+"') ";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (jxc_hjtzjl.ckbh='"+ckbh+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (jxc_hjtzjl.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jxc_hjtzjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jxc_hjtzjl.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (jxc_hjtzjl.ssfgs='"+ssfgs+"')";
	}

	ls_sql="SELECT tzph,DECODE(jxc_hjtzjl.clzt,'0','δ�ύ','9','�ύ'),ckmc,jxc_hjtzjl.lrr,jxc_hjtzjl.lrsj,b.dwmc lrbm,a.dwmc ssfgs,jxc_hjtzjl.bz  ";
	ls_sql+=" FROM jxc_hjtzjl,jxc_ckmc,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where jxc_hjtzjl.ckbh=jxc_ckmc.ckbh(+) and jxc_hjtzjl.ssfgs=a.dwbh and jxc_hjtzjl.lrbm=b.dwbh ";
    ls_sql+=" and jxc_hjtzjl.cllx='0'";//0�����ģ�1������
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_hjtzjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_hjtzjlList.jsp","","","EditJxc_hjtzjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"tzph","dqbm","ckbh","lrr","lrsj","ssfgs","ssbm","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"tzph"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"tzph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_hjtzjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tzph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

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
  <B><font size="3">���ܵ���ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="10%">����</td>
	<td  width="8%">����״̬</td>
	<td  width="13%">�ֿ�</td>
	<td  width="8%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="13%">¼�벿��</td>
	<td  width="13%">�ֹ�˾</td>
	<td  width="215%">��ע</td>
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