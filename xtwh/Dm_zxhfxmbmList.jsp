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
	String hfxmbm=null;
	String hfxmmc=null;
	String lx=null;
	hfxmbm=request.getParameter("hfxmbm");
	if (hfxmbm!=null)
	{
		hfxmbm=cf.GB2Uni(hfxmbm);
		if (!(hfxmbm.equals("")))	wheresql+=" and  (hfxmbm='"+hfxmbm+"')";
	}
	hfxmmc=request.getParameter("hfxmmc");
	if (hfxmmc!=null)
	{
		hfxmmc=cf.GB2Uni(hfxmmc);
		if (!(hfxmmc.equals("")))	wheresql+=" and  (hfxmmc='"+hfxmmc+"')";
	}
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (lx='"+lx+"')";
	}
	ls_sql="SELECT hfxmbm,hfxmmc, DECODE(lx,'1','��Ʒ����Ƿ�����','2','���ʦ��ͨ����','3','���ʦ����','4','���̱���','5','������Ա����','6','��˾����ӡ��','7','ϣ���Ľ�����')  lxmc";
	ls_sql+=" FROM dm_zxhfxmbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by lx,hfxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_zxhfxmbmList.jsp","","","EditDm_zxhfxmbm.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hfxmbm","hfxmmc","lx"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hfxmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_zxhfxmbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("lxmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] hfxmbm = request.getParameterValues("hfxmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hfxmbm,"hfxmbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_zxhfxmbm where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="20%">�ط���Ŀ����</td>
	<td  width="30%">�ط���Ŀ����</td>
	<td  width="30%">����</td>
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