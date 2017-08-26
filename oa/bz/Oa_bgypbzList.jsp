<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String oa_bgypbz_dwbh=null;
	String oa_bgypbz_xm=null;
	String oa_bgypbz_zw=null;
	String oa_bgypbz_je=null;
	String flbm=null;
	flbm=request.getParameter("flbm");
	if (flbm!=null)
	{
		flbm=cf.GB2Uni(flbm);
		if (!(flbm.equals("")))	wheresql+=" and  (oa_lqfw.flbm='"+flbm+"')";
	}
	oa_bgypbz_dwbh=request.getParameter("oa_bgypbz_dwbh");
	if (oa_bgypbz_dwbh!=null)
	{
		oa_bgypbz_dwbh=cf.GB2Uni(oa_bgypbz_dwbh);
		if (!(oa_bgypbz_dwbh.equals("")))	wheresql+=" and  (oa_bgypbz.dwbh='"+oa_bgypbz_dwbh+"')";
	}
	oa_bgypbz_xm=request.getParameter("oa_bgypbz_xm");
	if (oa_bgypbz_xm!=null)
	{
		oa_bgypbz_xm=cf.GB2Uni(oa_bgypbz_xm);
		if (!(oa_bgypbz_xm.equals("")))	wheresql+=" and  (oa_bgypbz.xm='"+oa_bgypbz_xm+"')";
	}
	oa_bgypbz_zw=request.getParameter("oa_bgypbz_zw");
	if (oa_bgypbz_zw!=null)
	{
		oa_bgypbz_zw=cf.GB2Uni(oa_bgypbz_zw);
		if (!(oa_bgypbz_zw.equals("")))	wheresql+=" and  (oa_bgypbz.zw='"+oa_bgypbz_zw+"')";
	}
	oa_bgypbz_je=request.getParameter("oa_bgypbz_je");
	if (oa_bgypbz_je!=null)
	{
		oa_bgypbz_je=oa_bgypbz_je.trim();
		if (!(oa_bgypbz_je.equals("")))	wheresql+=" and (oa_bgypbz.je="+oa_bgypbz_je+") ";
	}

	ls_sql="SELECT distinct a.dwmc dwmc,b.dwmc fgs,a.ssfgs,a.dwlx,oa_bgypbz.dwbh,oa_bgypbz.xm,oa_bgypbz.zw,oa_bgypbz.je";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b,oa_bgypbz,oa_lqfw,oa_flbm  ";
    ls_sql+=" where oa_bgypbz.dwbh=a.dwbh and a.ssfgs=b.dwbh";
    ls_sql+=" and oa_bgypbz.dwbh=oa_lqfw.dwbh(+) and oa_bgypbz.xm=oa_lqfw.xm(+) ";
	ls_sql+=" and oa_lqfw.flbm=oa_flbm.flbm(+)";

	if (!yhjs.equals("A0"))
	{
		ls_sql+=" and a.ssfgs='"+ssfgs+"'";
	}

    ls_sql+=wheresql;
	ls_sql+=" order by a.ssfgs,a.dwlx,oa_bgypbz.dwbh,oa_bgypbz.xm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Oa_bgypbzList.jsp","SelectOa_bgypbz.jsp","","EditOa_bgypbz.jsp");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"dwmc","fgs","xm","zw","je"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"dwbh","xm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Oa_bgypbzList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("fgs","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = request.getParameter("chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from oa_lqfw where "+chooseitem;
		sql[1]="delete from oa_bgypbz where "+chooseitem;
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
	<td  width="10%">&nbsp;</td>
	<td  width="20%">����</td>
	<td  width="20%">�ֹ�˾</td>
	<td  width="15%">����</td>
	<td  width="20%">ְλ</td>
	<td  width="15%">���</td>
</tr>
<%
	pageObj.printDateSum();
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