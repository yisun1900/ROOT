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
	String bj_dzbjbb_dqbm=null;
	String bj_dzbjbb_bjbbh=null;
	String bj_dzbjbb_qysj=null;
	String bj_dzbjbb_sfzybb=null;
	bj_dzbjbb_dqbm=request.getParameter("bj_dzbjbb_dqbm");
	if (bj_dzbjbb_dqbm!=null)
	{
		bj_dzbjbb_dqbm=cf.GB2Uni(bj_dzbjbb_dqbm);
		if (!(bj_dzbjbb_dqbm.equals("")))	wheresql+=" and  (bj_dzbjbb.dqbm='"+bj_dzbjbb_dqbm+"')";
	}
	bj_dzbjbb_bjbbh=request.getParameter("bj_dzbjbb_bjbbh");
	if (bj_dzbjbb_bjbbh!=null)
	{
		bj_dzbjbb_bjbbh=cf.GB2Uni(bj_dzbjbb_bjbbh);
		if (!(bj_dzbjbb_bjbbh.equals("")))	wheresql+=" and  (bj_dzbjbb.bjbbh='"+bj_dzbjbb_bjbbh+"')";
	}
	bj_dzbjbb_qysj=request.getParameter("bj_dzbjbb_qysj");
	if (bj_dzbjbb_qysj!=null)
	{
		bj_dzbjbb_qysj=bj_dzbjbb_qysj.trim();
		if (!(bj_dzbjbb_qysj.equals("")))	wheresql+="  and (bj_dzbjbb.qysj>=TO_DATE('"+bj_dzbjbb_qysj+"','YYYY/MM/DD'))";
	}
	bj_dzbjbb_qysj=request.getParameter("bj_dzbjbb_qysj2");
	if (bj_dzbjbb_qysj!=null)
	{
		bj_dzbjbb_qysj=bj_dzbjbb_qysj.trim();
		if (!(bj_dzbjbb_qysj.equals("")))	wheresql+="  and (bj_dzbjbb.qysj<=TO_DATE('"+bj_dzbjbb_qysj+"','YYYY/MM/DD'))";
	}
	bj_dzbjbb_sfzybb=request.getParameter("bj_dzbjbb_sfzybb");
	if (bj_dzbjbb_sfzybb!=null)
	{
		bj_dzbjbb_sfzybb=cf.GB2Uni(bj_dzbjbb_sfzybb);
		if (!(bj_dzbjbb_sfzybb.equals("")))	wheresql+=" and  (bj_dzbjbb.sfzybb='"+bj_dzbjbb_sfzybb+"')";
	}
	ls_sql="SELECT bj_dzbjbb.dqbm,dm_dqbm.dqmc,bj_dzbjbb.bjbbh,bj_dzbjbb.qysj,bj_dzbjbb.yxq,DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��'),bj_dzbjbb.bz  ";
	ls_sql+=" FROM dm_dqbm,bj_dzbjbb  ";
    ls_sql+=" where bj_dzbjbb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_dzbjbb.dqbm,bj_dzbjbb.qysj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_dzbjbbList.jsp","","","EditBj_dzbjbb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjbbh","bj_dzbjbb_qysj","bj_dzbjbb_sfyqy","bj_dzbjbb_sfzybb","bj_dzbjbb_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dqbm","bjbbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Bj_dzbjbbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[9];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from bj_dzbjbb where "+chooseitem;
		sql[1]="delete from bj_jzbjb where "+chooseitem;
		sql[2]="delete from bj_glxmb where "+chooseitem;
		sql[3]="delete from bj_jzglfxb where "+chooseitem;
		sql[4]="delete from bj_tcjgb where "+chooseitem;
		sql[5]="delete from bj_tcsjcjb where "+chooseitem;
		sql[6]="delete from bj_tcbzgcxm where "+chooseitem;
		sql[7]="delete from bj_tcbzzcxm where "+chooseitem;
		sql[8]="delete from bj_tczcbj where "+chooseitem;
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
  <B><font size="3">ά�����۰汾</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">��������</td>
	<td  width="10%">��������</td>
	<td  width="23%">���۰汾��</td>
	<td  width="10%">����ʱ��</td>
	<td  width="10%">��Ч��</td>
	<td  width="7%">�Ƿ����ð汾</td>
	<td  width="24%">��ע</td>
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