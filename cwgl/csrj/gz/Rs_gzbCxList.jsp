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
	String rs_gzb_khzq=null;
	String rs_gzb_ssfgs=null;
	String rs_gzb_fxrq=null;
	String rs_gzb_ksrq=null;
	String rs_gzb_zzrq=null;
	String rs_gzb_qqts=null;
	String rs_gzb_lrr=null;
	String rs_gzb_lrsj=null;
	String rs_gzb_lrbm=null;
	rs_gzb_khzq=request.getParameter("rs_gzb_khzq");
	if (rs_gzb_khzq!=null)
	{
		rs_gzb_khzq=cf.GB2Uni(rs_gzb_khzq);
		if (!(rs_gzb_khzq.equals("")))	wheresql+=" and  (rs_gzb.khzq='"+rs_gzb_khzq+"')";
	}
	rs_gzb_ssfgs=request.getParameter("rs_gzb_ssfgs");
	if (rs_gzb_ssfgs!=null)
	{
		rs_gzb_ssfgs=cf.GB2Uni(rs_gzb_ssfgs);
		if (!(rs_gzb_ssfgs.equals("")))	wheresql+=" and  (rs_gzb.ssfgs='"+rs_gzb_ssfgs+"')";
	}
	rs_gzb_fxrq=request.getParameter("rs_gzb_fxrq");
	if (rs_gzb_fxrq!=null)
	{
		rs_gzb_fxrq=rs_gzb_fxrq.trim();
		if (!(rs_gzb_fxrq.equals("")))	wheresql+="  and (rs_gzb.fxrq=TO_DATE('"+rs_gzb_fxrq+"','YYYY/MM/DD'))";
	}
	rs_gzb_ksrq=request.getParameter("rs_gzb_ksrq");
	if (rs_gzb_ksrq!=null)
	{
		rs_gzb_ksrq=rs_gzb_ksrq.trim();
		if (!(rs_gzb_ksrq.equals("")))	wheresql+="  and (rs_gzb.ksrq=TO_DATE('"+rs_gzb_ksrq+"','YYYY/MM/DD'))";
	}
	rs_gzb_zzrq=request.getParameter("rs_gzb_zzrq");
	if (rs_gzb_zzrq!=null)
	{
		rs_gzb_zzrq=rs_gzb_zzrq.trim();
		if (!(rs_gzb_zzrq.equals("")))	wheresql+="  and (rs_gzb.zzrq=TO_DATE('"+rs_gzb_zzrq+"','YYYY/MM/DD'))";
	}
	rs_gzb_qqts=request.getParameter("rs_gzb_qqts");
	if (rs_gzb_qqts!=null)
	{
		rs_gzb_qqts=rs_gzb_qqts.trim();
		if (!(rs_gzb_qqts.equals("")))	wheresql+=" and  (rs_gzb.qqts="+rs_gzb_qqts+") ";
	}
	rs_gzb_lrr=request.getParameter("rs_gzb_lrr");
	if (rs_gzb_lrr!=null)
	{
		rs_gzb_lrr=cf.GB2Uni(rs_gzb_lrr);
		if (!(rs_gzb_lrr.equals("")))	wheresql+=" and  (rs_gzb.lrr='"+rs_gzb_lrr+"')";
	}
	rs_gzb_lrsj=request.getParameter("rs_gzb_lrsj");
	if (rs_gzb_lrsj!=null)
	{
		rs_gzb_lrsj=rs_gzb_lrsj.trim();
		if (!(rs_gzb_lrsj.equals("")))	wheresql+="  and (rs_gzb.lrsj=TO_DATE('"+rs_gzb_lrsj+"','YYYY/MM/DD'))";
	}
	rs_gzb_lrbm=request.getParameter("rs_gzb_lrbm");
	if (rs_gzb_lrbm!=null)
	{
		rs_gzb_lrbm=cf.GB2Uni(rs_gzb_lrbm);
		if (!(rs_gzb_lrbm.equals("")))	wheresql+=" and  (rs_gzb.lrbm='"+rs_gzb_lrbm+"')";
	}
	ls_sql="SELECT rs_gzb.khzq,rs_gzb.ssfgs,sq_dwxx.dwmc,rs_gzb.fxrq,rs_gzb.ksrq,rs_gzb.zzrq,rs_gzb.qqts,rs_gzb.lrr,rs_gzb.lrsj,rs_gzb.lrbm,rs_gzb.bz  ";
	ls_sql+=" FROM sq_dwxx,rs_gzb  ";
    ls_sql+=" where rs_gzb.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_gzbCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khzq","ssfgs","sq_dwxx_dwmc","rs_gzb_fxrq","rs_gzb_ksrq","rs_gzb_zzrq","rs_gzb_qqts","rs_gzb_lrr","rs_gzb_lrsj","rs_gzb_lrbm","rs_gzb_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khzq","ssfgs"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khzq","ssfgs"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewRs_gzb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khzq",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
	<td  width="9%">��������</td>
	<td  width="9%">�ֹ�˾</td>
	<td  width="9%">�ֹ�˾</td>
	<td  width="9%">��н����</td>
	<td  width="9%">���ʿ�ʼ����</td>
	<td  width="9%">������ֹ����</td>
	<td  width="9%">ȫ������</td>
	<td  width="9%">¼����</td>
	<td  width="9%">¼��ʱ��</td>
	<td  width="9%">¼�벿��</td>
	<td  width="9%">��ע</td>
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