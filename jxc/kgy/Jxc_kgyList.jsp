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
    ls_sql+=" where jxc_kgy.ckbh=jxc_ckmc.ckbh and jxc_ckmc.dqbm=dm_dqbm.dqbm ";
    ls_sql+=" and jxc_kgy.yhdlm=sq_yhxx.yhdlm(+)";
    ls_sql+=" and sq_yhxx.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_ckmc.dqbm,jxc_kgy.ckbh,jxc_kgy.yhdlm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_kgyList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"yhdlm","ckbh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"yhdlm","ckbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jxc_kgyList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jxc_kgy where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
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
	<td  width="4%">&nbsp;</td>
	<td  width="10%">�ֿ���</td>
	<td  width="20%">�ֿ�����</td>
	<td  width="10%">����</td>
	<td  width="15%">���Ա��¼��</td>
	<td  width="8%">����</td>
	<td  width="8%">Ա��״̬</td>
	<td  width="32%">����</td>
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