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
String yhmc=(String)session.getAttribute("yhmc");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String oa_lqsq_bgypbm=null;
	String oa_lqsq_dwbh=null;
	String oa_lqsq_slr=null;
	String oa_lqsq_lrr=null;
	String oa_lqsq_lrrq=null;
	String oa_lqsq_jhlqsl=null;
	String oa_lqsq_jhlqrq=null;
	String oa_lqsq_lqzt=null;
	String oa_lqsq_slqsl=null;
	String oa_lqsq_blr=null;
	String oa_lqsq_lqsj=null;
	oa_lqsq_bgypbm=request.getParameter("oa_lqsq_bgypbm");
	if (oa_lqsq_bgypbm!=null)
	{
		oa_lqsq_bgypbm=cf.GB2Uni(oa_lqsq_bgypbm);
		if (!(oa_lqsq_bgypbm.equals("")))	wheresql+=" and  (oa_lqsq.bgypbm='"+oa_lqsq_bgypbm+"')";
	}
	oa_lqsq_dwbh=request.getParameter("oa_lqsq_dwbh");
	if (oa_lqsq_dwbh!=null)
	{
		oa_lqsq_dwbh=cf.GB2Uni(oa_lqsq_dwbh);
		if (!(oa_lqsq_dwbh.equals("")))	wheresql+=" and  (oa_lqsq.dwbh='"+oa_lqsq_dwbh+"')";
	}
	oa_lqsq_slr=request.getParameter("oa_lqsq_slr");
	if (oa_lqsq_slr!=null)
	{
		oa_lqsq_slr=cf.GB2Uni(oa_lqsq_slr);
		if (!(oa_lqsq_slr.equals("")))	wheresql+=" and  (oa_lqsq.slr='"+oa_lqsq_slr+"')";
	}
	oa_lqsq_lrr=request.getParameter("oa_lqsq_lrr");
	if (oa_lqsq_lrr!=null)
	{
		oa_lqsq_lrr=cf.GB2Uni(oa_lqsq_lrr);
		if (!(oa_lqsq_lrr.equals("")))	wheresql+=" and  (oa_lqsq.lrr='"+oa_lqsq_lrr+"')";
	}
	oa_lqsq_lrrq=request.getParameter("oa_lqsq_lrrq");
	if (oa_lqsq_lrrq!=null)
	{
		oa_lqsq_lrrq=oa_lqsq_lrrq.trim();
		if (!(oa_lqsq_lrrq.equals("")))	wheresql+="  and (oa_lqsq.lrrq>=TO_DATE('"+oa_lqsq_lrrq+"','YYYY/MM/DD'))";
	}
	oa_lqsq_lrrq=request.getParameter("oa_lqsq_lrrq2");
	if (oa_lqsq_lrrq!=null)
	{
		oa_lqsq_lrrq=oa_lqsq_lrrq.trim();
		if (!(oa_lqsq_lrrq.equals("")))	wheresql+="  and (oa_lqsq.lrrq<=TO_DATE('"+oa_lqsq_lrrq+"','YYYY/MM/DD'))";
	}
	oa_lqsq_jhlqsl=request.getParameter("oa_lqsq_jhlqsl");
	if (oa_lqsq_jhlqsl!=null)
	{
		oa_lqsq_jhlqsl=oa_lqsq_jhlqsl.trim();
		if (!(oa_lqsq_jhlqsl.equals("")))	wheresql+=" and (oa_lqsq.jhlqsl>="+oa_lqsq_jhlqsl+") ";
	}
	oa_lqsq_jhlqsl=request.getParameter("oa_lqsq_jhlqsl2");
	if (oa_lqsq_jhlqsl!=null)
	{
		oa_lqsq_jhlqsl=oa_lqsq_jhlqsl.trim();
		if (!(oa_lqsq_jhlqsl.equals("")))	wheresql+=" and (oa_lqsq.jhlqsl<="+oa_lqsq_jhlqsl+") ";
	}
	oa_lqsq_jhlqrq=request.getParameter("oa_lqsq_jhlqrq");
	if (oa_lqsq_jhlqrq!=null)
	{
		oa_lqsq_jhlqrq=oa_lqsq_jhlqrq.trim();
		if (!(oa_lqsq_jhlqrq.equals("")))	wheresql+="  and (oa_lqsq.jhlqrq>=TO_DATE('"+oa_lqsq_jhlqrq+"','YYYY/MM/DD'))";
	}
	oa_lqsq_jhlqrq=request.getParameter("oa_lqsq_jhlqrq2");
	if (oa_lqsq_jhlqrq!=null)
	{
		oa_lqsq_jhlqrq=oa_lqsq_jhlqrq.trim();
		if (!(oa_lqsq_jhlqrq.equals("")))	wheresql+="  and (oa_lqsq.jhlqrq<=TO_DATE('"+oa_lqsq_jhlqrq+"','YYYY/MM/DD'))";
	}
	oa_lqsq_lqzt=request.getParameter("oa_lqsq_lqzt");
	if (oa_lqsq_lqzt!=null)
	{
		oa_lqsq_lqzt=cf.GB2Uni(oa_lqsq_lqzt);
		if (!(oa_lqsq_lqzt.equals("")))	wheresql+=" and  (oa_lqsq.lqzt='"+oa_lqsq_lqzt+"')";
	}
	oa_lqsq_slqsl=request.getParameter("oa_lqsq_slqsl");
	if (oa_lqsq_slqsl!=null)
	{
		oa_lqsq_slqsl=oa_lqsq_slqsl.trim();
		if (!(oa_lqsq_slqsl.equals("")))	wheresql+=" and (oa_lqsq.slqsl>="+oa_lqsq_slqsl+") ";
	}
	oa_lqsq_slqsl=request.getParameter("oa_lqsq_slqsl2");
	if (oa_lqsq_slqsl!=null)
	{
		oa_lqsq_slqsl=oa_lqsq_slqsl.trim();
		if (!(oa_lqsq_slqsl.equals("")))	wheresql+=" and (oa_lqsq.slqsl<="+oa_lqsq_slqsl+") ";
	}
	oa_lqsq_blr=request.getParameter("oa_lqsq_blr");
	if (oa_lqsq_blr!=null)
	{
		oa_lqsq_blr=cf.GB2Uni(oa_lqsq_blr);
		if (!(oa_lqsq_blr.equals("")))	wheresql+=" and  (oa_lqsq.blr='"+oa_lqsq_blr+"')";
	}
	oa_lqsq_lqsj=request.getParameter("oa_lqsq_lqsj");
	if (oa_lqsq_lqsj!=null)
	{
		oa_lqsq_lqsj=oa_lqsq_lqsj.trim();
		if (!(oa_lqsq_lqsj.equals("")))	wheresql+="  and (oa_lqsq.lqsj>=TO_DATE('"+oa_lqsq_lqsj+"','YYYY/MM/DD'))";
	}
	oa_lqsq_lqsj=request.getParameter("oa_lqsq_lqsj2");
	if (oa_lqsq_lqsj!=null)
	{
		oa_lqsq_lqsj=oa_lqsq_lqsj.trim();
		if (!(oa_lqsq_lqsj.equals("")))	wheresql+="  and (oa_lqsq.lqsj<=TO_DATE('"+oa_lqsq_lqsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT TO_CHAR(oa_lqsq.xh) xh,sq_dwxx.dwmc,oa_lqsq.slr as slr,oa_bgypbm.bgypmc,TO_CHAR(dj) dj,oa_lqsq.jhlqsl as oa_lqsq_jhlqsl,oa_lqsq.jhlqsl*dj jhje,oa_lqsq.lrrq as lrrq,oa_lqsq.jhlqrq as oa_lqsq_jhlqrq, DECODE(oa_lqsq.lqzt,'N','δ��ȡ','Y','����ȡ') as oa_lqsq_lqzt";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq,sq_dwxx  ";
    ls_sql+=" where oa_lqsq.dwbh=sq_dwxx.dwbh and oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
    ls_sql+=" and oa_bgypbm.fgsbh=sq_dwxx.ssfgs";

	if (!yhjs.equals("A0"))
	{
		ls_sql+=" and sq_dwxx.ssfgs='"+ssfgs+"'";
	}

    ls_sql+=wheresql;
	ls_sql+=" order by sq_dwxx.dwmc,oa_lqsq.slr";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Oa_lqsqLqList.jsp","SelectLqOa_lqsq.jsp","LqOa_lqsq.jsp","");
	pageObj.setViewStr("��ȡ");

	pageObj.setPageRow(19);//����ÿҳ��ʾ��¼��
//������ʾ��
/*
	String[] disColName={"oa_bgypbm_bgypmc","dj","slr","sqrq","oa_lqsq_jhlqsl","jhje","oa_lqsq_jhlqrq","oa_lqsq_lqzt","oa_lqsq_slqsl","sjje","oa_lqsq_blr","oa_lqsq_lqsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"������ȡ"};//��ť����ʾ����
	String[] buttonLink={"Oa_lqsqLqList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);


//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("slr","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="update oa_lqsq  set lqzt='Y',slqsl=jhlqsl,blr='"+yhmc+"',lqsj=SYSDATE where "+chooseitem;
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
	<td  width="7%">�������</td>
	<td  width="11%">��λ</td>
	<td  width="9%">������</td>
	<td  width="14%">�칫��Ʒ</td>
	<td  width="8%">����</td>
	<td  width="8%">�ƻ�����</td>
	<td  width="10%">���</td>
	<td  width="9%">��������</td>
	<td  width="9%">�ƻ���ȡ����</td>
	<td  width="7%">��ȡ״̬</td>
</tr>
<%
	pageObj.displayDateSum();
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