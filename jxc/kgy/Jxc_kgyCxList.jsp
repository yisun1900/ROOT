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
	String yhdlm=null;
	String ckbh=null;
	String dqbm=null;
	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (jxc_kgy.yhdlm='"+yhdlm+"')";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (jxc_kgy.ckbh='"+ckbh+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(ckbh);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_ckmc.dqbm='"+dqbm+"')";
	}

	ls_sql="SELECT jxc_kgy.ckbh ckbh,ckmc,dqmc,jxc_kgy.yhdlm,sq_yhxx.yhmc,DECODE(sq_yhxx.sfzszg,'M','<font color=\"#009999\">ʵϰ��</font>','Y','ת��','N','<font color=\"#0000CC\">������</font>','D','<font color=\"#CCCC00\">����</font>','S','<font color=\"#CC0000\">��ְ</font>','T','<font color=\"#CC00CC\">����</font>','C','<font color=\"#CC00CC\">��Ȩ</font>'),dwmc  ";
	ls_sql+=" FROM jxc_kgy,jxc_ckmc,dm_dqbm,sq_yhxx,sq_dwxx  ";
    ls_sql+=" where jxc_kgy.ckbh=jxc_ckmc.ckbh(+) and jxc_ckmc.dqbm=dm_dqbm.dqbm(+) ";
    ls_sql+=" and jxc_kgy.yhdlm=sq_yhxx.yhdlm(+)";
    ls_sql+=" and sq_yhxx.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_ckmc.dqbm,jxc_kgy.ckbh,jxc_kgy.yhdlm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_kgyCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"yhdlm","ckbh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"yhdlm"};
	pageObj.setKey(keyName);

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
	<td  width="10%">�ֿ���</td>
	<td  width="20%">�ֿ�����</td>
	<td  width="10%">����</td>
	<td  width="15%">���Ա��¼��</td>
	<td  width="8%">����</td>
	<td  width="8%">Ա��״̬</td>
	<td  width="34%">����</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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