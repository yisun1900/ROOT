<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String ckjgbz=(String)session.getAttribute("ckjgbz");


int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
		String ls_sql=null;
	String wheresql="";
	String wtbh=null;
	String dcqs=null;
	String wtmc=null;
	String sfkdx=null;
	String wtsfgq=null;
	String wtfl=null;
	String xwtsm=null;
	String lrsj1=null;
	String lrsj2=null;
	lrsj1=request.getParameter("zdsj1");
	lrsj2=request.getParameter("zdsj2");

	wtbh=request.getParameter("wtbh");
	if (wtbh!=null)
	{
		wtbh=cf.GB2Uni(wtbh);
		if (!(wtbh.equals("")))	wheresql+=" and  (hd_scdcwt.wtbh='"+wtbh+"')";
	}
	dcqs=request.getParameter("dcqs");
	if (dcqs!=null)
	{
		dcqs=cf.GB2Uni(dcqs);
		if (!(dcqs.equals("")))	wheresql+=" and  (hd_scdcwt.dcqs='"+dcqs+"')";
	}
	wtmc=request.getParameter("wtmc");
	if (wtmc!=null)
	{
		wtmc=cf.GB2Uni(wtmc);
		if (!(wtmc.equals("")))	wheresql+=" and  (hd_scdcwt.wtmc='"+wtmc+"')";
	}
	sfkdx=request.getParameter("sfkdx");
	if (sfkdx!=null)
	{
		sfkdx=cf.GB2Uni(sfkdx);
		if (!(sfkdx.equals("")))	wheresql+=" and  (hd_scdcwt.sfkdx='"+sfkdx+"')";
	}
	wtsfgq=request.getParameter("wtsfgq");
	if (wtsfgq!=null)
	{
		wtsfgq=cf.GB2Uni(wtsfgq);
		if (!(wtsfgq.equals("")))	wheresql+=" and  (hd_scdcwt.wtsfgq='"+wtsfgq+"')";
	}
	wtfl=request.getParameter("wtfl");
	if (wtfl!=null)
	{
		wtfl=cf.GB2Uni(wtfl);
		if (!(wtfl.equals("")))	wheresql+=" and  (hd_scdcwt.wtfl='"+wtfl+"')";
	}
	xwtsm=request.getParameter("xwtsm");
	if (xwtsm!=null)
	{
		xwtsm=cf.GB2Uni(xwtsm);
		if (!(xwtsm.equals("")))	wheresql+=" and  (hd_scdcwt.xwtsm='"+xwtsm+"')";
	}
	

	
	ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,wtmc,wtkxda,dcqs,zdsj ";
	ls_sql+=" FROM crm_khxx,hd_scdcjg,hd_scdcwt";
    ls_sql+=" where hd_scdcjg.khbh=crm_khxx.khbh(+) and hd_scdcjg.wtbh=hd_scdcwt.wtbh";
	 if (lrsj1!=null && (!(lrsj1.equals(""))))
	{
			ls_sql+=" and zdsj>=to_Date('"+lrsj1+"','YYYY-MM-DD') ";
	}
	if (lrsj2!=null && (!(lrsj2.equals(""))))
	{
				ls_sql+=" and zdsj<=to_Date('"+lrsj2+"23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	}
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hd_ckjgList.jsp","yjdcjg.jsp","","");
	//pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_xb","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qye","crm_khxx_jcjjqye","crm_khxx_qyrq","crm_khxx_jsje","crm_khxx_gcjdbm","sq_dwxx_dwmc","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.alignStr[6]="align='left'";

	//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("hth","1");//�в����������Hash��
	spanColHash.put("wtmc","1");//�в����������Hash��
	
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
  <B><font size="3">�ͻ�������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�ͻ����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="18%">���ݵ�ַ</td>
	<td  width="6%">��ͬ��</td>
	<td  width="21%">��������</td>
	<td  width="21%">�����</td>
	<td  width="15%">��������</td>
	<td  width="7%">����ʱ��</td>
</tr>
<%
	pageObj.displayDate();
//	pageObj.printSum();
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