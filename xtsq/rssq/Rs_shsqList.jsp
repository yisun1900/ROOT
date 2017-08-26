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
	String ztbm=null;
	String yhzbh=null;
	String ztlx=null;
	ztbm=request.getParameter("ztbm");
	if (ztbm!=null)
	{
		ztbm=cf.GB2Uni(ztbm);
		if (!(ztbm.equals("")))	wheresql+=" and  (rs_shsq.ztbm='"+ztbm+"')";
	}
	yhzbh=request.getParameter("yhzbh");
	if (yhzbh!=null)
	{
		yhzbh=cf.GB2Uni(yhzbh);
		if (!(yhzbh.equals("")))	wheresql+=" and  (rs_shsq.yhzbh='"+yhzbh+"')";
	}
	ztlx=request.getParameter("ztlx");
	if (ztlx!=null)
	{
		ztlx=cf.GB2Uni(ztlx);
		if (!(ztlx.equals("")))	wheresql+=" and  (rs_ztbm.ztlx='"+ztlx+"')";
	}

	ls_sql="SELECT DECODE(rs_ztbm.ztlx,'01','��Ƹ','02','��ѵ','03','�䶯','04','��������','06','������ְ','07','��������','08','�Ӱ�����','09','���ڿ�������','10','��ٵ�','11','��������','12','�����λ����') ztlxmc,rs_ztbm.ztmc,sq_yhz.yhzmc,rs_shsq.ztbm ztbm,rs_shsq.yhzbh yhzbh";
	ls_sql+=" FROM rs_shsq,rs_ztbm,sq_yhz  ";
    ls_sql+=" where rs_shsq.ztbm=rs_ztbm.ztbm and rs_shsq.yhzbh=sq_yhz.yhzbh";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_shsq.yhzbh,rs_ztbm.ztlx,rs_ztbm.ztbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_shsqList.jsp","SelectRs_shsq.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"yhzmc","ztlxmc","ztmc"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"ztbm","yhzbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_shsqList.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("yhzmc","1");//�в����������Hash��
	spanColHash.put("ztlxmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from rs_shsq where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="24%">�û�������</td>
	<td  width="24%">�������</td>
	<td  width="44%">���״̬</td>
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