<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
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
	String qh_lfcxdjb_zpnr=null;
	String crm_zxkhxx_khxm=null;
	String crm_zxkhxx_sjs=null;
	String qh_lfcxdjb_djrq=null;
	qh_lfcxdjb_zpnr=request.getParameter("qh_lfcxdjb_zpnr");
	if (qh_lfcxdjb_zpnr!=null)
	{
		qh_lfcxdjb_zpnr=cf.GB2Uni(qh_lfcxdjb_zpnr);
		if (!(qh_lfcxdjb_zpnr.equals("")))	wheresql+=" and  (qh_lfcxdjb.zpnr='"+qh_lfcxdjb_zpnr+"')";
	}
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	crm_zxkhxx_sjs=request.getParameter("crm_zxkhxx_sjs");
	if (crm_zxkhxx_sjs!=null)
	{
		crm_zxkhxx_sjs=cf.GB2Uni(crm_zxkhxx_sjs);
		if (!(crm_zxkhxx_sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+crm_zxkhxx_sjs+"')";
	}
	qh_lfcxdjb_djrq=request.getParameter("qh_lfcxdjb_djrq");
	if (qh_lfcxdjb_djrq!=null)
	{
		qh_lfcxdjb_djrq=qh_lfcxdjb_djrq.trim();
		if (!(qh_lfcxdjb_djrq.equals("")))	wheresql+="  and (qh_lfcxdjb.djrq>=TO_DATE('"+qh_lfcxdjb_djrq+"','YYYY/MM/DD'))";
	}
	qh_lfcxdjb_djrq=request.getParameter("qh_lfcxdjb_djrq2");
	if (qh_lfcxdjb_djrq!=null)
	{
		qh_lfcxdjb_djrq=qh_lfcxdjb_djrq.trim();
		if (!(qh_lfcxdjb_djrq.equals("")))	wheresql+="  and (qh_lfcxdjb.djrq<=TO_DATE('"+qh_lfcxdjb_djrq+"','YYYY/MM/DD'))";
	}
		 if (yhjs.equals("A0")||yhjs.equals("A1"))
	{ 
		wheresql+=" and (1=1)";
	 }
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="and (sq_dwxx.ssdw='"+ssfgs+"')";
	 }
	 else
	 {
		wheresql+="and (sq_dwxx.dwbh='"+dwbh+"')";
	 }
	ls_sql="SELECT qh_lfcxdjb.djxh as djxh,qh_lfcxdjb.djrq as qh_lfcxdjb_djrq,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,qh_lfcxdjb.zpnr as qh_lfcxdjb_zpnr,crm_zxkhxx.sjs as crm_zxkhxx_sjs,qh_lfcxdjb.jsr as qh_lfcxdjb_jsr,qh_lfcxdjb.bz as qh_lfcxdjb_bz   ";
	ls_sql+=" FROM crm_zxkhxx,qh_lfcxdjb,sq_dwxx  ";
    ls_sql+=" where qh_lfcxdjb.khbh=crm_zxkhxx.khbh and (sq_dwxx.dwbh(+)=crm_zxkhxx.zxdm)";
    ls_sql+=wheresql;
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Qh_lfcxdjb1List.jsp","SelectQh_lfcxdjb1.jsp","ViewQh_lfcxdjb1.jsp","EditQh_lfcxdjb1.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"djxh","qh_lfcxdjb_khbh","qh_lfcxdjb_zpnr","qh_lfcxdjb_jsr","crm_zxkhxx_khxm","crm_zxkhxx_lxfs","crm_zxkhxx_sjs","qh_lfcxdjb_djrq"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"djxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Qh_lfcxdjb1List.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] djxh = request.getParameterValues("djxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(djxh,"djxh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from qh_lfcxdjb where "+chooseitem;
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
	<td  width="11%">�Ǽ����</td>
	<td  width="11%">�Ǽ�����</td>
	<td  width="11%">�ͻ�����</td>
	<td  width="11%">��ϵ��ʽ</td>	
	<td  width="11%">��Ʒ����</td>
	<td  width="11%">���ʦ</td>
	<td  width="11%">������</td>
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