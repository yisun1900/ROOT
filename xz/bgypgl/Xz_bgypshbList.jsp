<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
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
	String xz_bgypshb_sqxh=null;
	String xz_bgypshb_dwbh=null;
	String xz_bgypshb_sqrq=null;
	String xz_bgypshb_sqr=null;
	String xz_bgypshb_bgypbh=null;
	xz_bgypshb_sqxh=request.getParameter("xz_bgypshb_sqxh");
	if (xz_bgypshb_sqxh!=null)
	{
		xz_bgypshb_sqxh=cf.GB2Uni(xz_bgypshb_sqxh);
		if (!(xz_bgypshb_sqxh.equals("")))	wheresql+=" and  (xz_bgypshb.sqxh='"+xz_bgypshb_sqxh+"')";
	}
	xz_bgypshb_dwbh=request.getParameter("xz_bgypshb_dwbh");
	if (xz_bgypshb_dwbh!=null)
	{
		xz_bgypshb_dwbh=cf.GB2Uni(xz_bgypshb_dwbh);
		if (!(xz_bgypshb_dwbh.equals("")))	wheresql+=" and  (xz_bgypshb.dwbh='"+xz_bgypshb_dwbh+"')";
	}
	xz_bgypshb_sqrq=request.getParameter("xz_bgypshb_sqrq");
	if (xz_bgypshb_sqrq!=null)
	{
		xz_bgypshb_sqrq=xz_bgypshb_sqrq.trim();
		if (!(xz_bgypshb_sqrq.equals("")))	wheresql+="  and (xz_bgypshb.sqrq>=TO_DATE('"+xz_bgypshb_sqrq+"','YYYY/MM/DD'))";
	}
	xz_bgypshb_sqrq=request.getParameter("xz_bgypshb_sqrq2");
	if (xz_bgypshb_sqrq!=null)
	{
		xz_bgypshb_sqrq=xz_bgypshb_sqrq.trim();
		if (!(xz_bgypshb_sqrq.equals("")))	wheresql+="  and (xz_bgypshb.sqrq<=TO_DATE('"+xz_bgypshb_sqrq+"','YYYY/MM/DD'))";
	}
	xz_bgypshb_sqr=request.getParameter("xz_bgypshb_sqr");
	if (xz_bgypshb_sqr!=null)
	{
		xz_bgypshb_sqr=cf.GB2Uni(xz_bgypshb_sqr);
		if (!(xz_bgypshb_sqr.equals("")))	wheresql+=" and  (xz_bgypshb.sqr='"+xz_bgypshb_sqr+"')";
	}
	xz_bgypshb_bgypbh=request.getParameter("xz_bgypshb_bgypbh");
	if (xz_bgypshb_bgypbh!=null)
	{
		xz_bgypshb_bgypbh=cf.GB2Uni(xz_bgypshb_bgypbh);
		if (!(xz_bgypshb_bgypbh.equals("")))	wheresql+=" and  (xz_bgypshb.bgypbh='"+xz_bgypshb_bgypbh+"')";
	}
		if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+=" and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="  and ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	}


	ls_sql="SELECT xz_bgypshb.sqxh as sqxh,sq_dwxx.dwmc as xz_bgypshb_dwbh,xz_bgypshb.sqrq as xz_bgypshb_sqrq,xz_bgypshb.sqr as xz_bgypshb_sqr,xz_bgypbm.bgypmc as xz_bgypshb_bgypbh,xz_bgypshb.sqsl as xz_bgypshb_sqsl,xz_bgypshb.pzsl as xz_bgypshb_pzsl,xz_bgypshb.syjcsl as xz_bgypshb_syjcsl,xz_bgypshb.bz as xz_bgypshb_bz  ";
	ls_sql+=" FROM xz_bgypbm,xz_bgypshb,sq_dwxx  ";
    ls_sql+=" where xz_bgypshb.bgypbh=xz_bgypbm.bgypbh and xz_bgypshb.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_bgypshbList.jsp","SelectXz_bgypshb.jsp","ViewXz_bgypshb.jsp","EditXz_bgypshb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqxh","xz_bgypshb_dwbh","xz_bgypshb_sqrq","xz_bgypshb_sqr","xz_bgypshb_bgypbh","xz_bgypshb_sqsl","xz_bgypshb_pzsl","xz_bgypshb_syjcsl","xz_bgypshb_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Xz_bgypshbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
	String[] sqxh = request.getParameterValues("sqxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(sqxh,"sqxh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from xz_bgypshb where "+chooseitem;
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
	<td  width="7%">�������</td>
	<td  width="8%">���벿��</td>
	<td  width="8%">��������</td>
	<td  width="6%">������</td>
	<td  width="9%">�칫��Ʒ</td>
	<td  width="5%">��������</td>
	<td  width="5%">��׼����</td>
	<td  width="5%">���½������</td>
	<td  width="14%">��ע</td>
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