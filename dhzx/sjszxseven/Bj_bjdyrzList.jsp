<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
//	String yhqx=cf.executeQuery("select count(*)  from  v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='011503'");
//	if (yhqx.equals("0"))
//	{
//		String xtrzip=request.getRemoteHost();
//		String xtrzyhmc=(String)session.getAttribute("yhmc");
//
//		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,dysj,bz ) ";
//		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[ϵͳ��־]��"+xtrzyhmc+"') ";
//		cf.executeUpdate(sql);
//
//		session.setAttribute("yhdlm",null);
//		return;
//	}
%>
<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ip=null;
	String yhdlm=null;
	String yhmc=null;
	String dysj=null;


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	ip=request.getParameter("ip");
	if (ip!=null)
	{
		ip=cf.GB2Uni(ip);
		if (!(ip.equals("")))	wheresql+=" and  (bj_bjdyrz.ip='"+ip+"')";
	}

	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (bj_bjdyrz.yhdlm='"+yhdlm+"')";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc='"+yhmc+"')";
	}
	dysj=request.getParameter("dysj");
	if (dysj!=null)
	{
		dysj=dysj.trim();
		if (!(dysj.equals("")))	wheresql+="  and (bj_bjdyrz.dysj>=TO_DATE('"+dysj+"','YYYY/MM/DD'))";
	}
	dysj=request.getParameter("dysj2");
	if (dysj!=null)
	{
		dysj=dysj.trim();
		if (!(dysj.equals("")))	wheresql+="  and (bj_bjdyrz.dysj<=TO_DATE('"+dysj+"','YYYY/MM/DD'))";
	}


	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (bj_bjdyrz.khbh='"+khbh+"')";
	}
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}


	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	ls_sql="SELECT bj_bjdyrz.dysj,bj_bjdyrz.ip,bj_bjdyrz.khbh,khxm,hth,bj_bjdyrz.yhdlm,bj_bjdyrz.yhmc,b.dwmc xxx,a.dwmc ssfgs ";
	ls_sql+=" FROM sq_yhxx,bj_bjdyrz,sq_dwxx b,sq_dwxx a,crm_khxx  ";
    ls_sql+=" where bj_bjdyrz.yhdlm=sq_yhxx.yhdlm(+) and sq_yhxx.dwbh=b.dwbh(+) and sq_yhxx.ssfgs=a.dwbh(+)";
    ls_sql+=" and bj_bjdyrz.khbh=crm_khxx.khbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_bjdyrz.dysj desc";
	//out.print("Exception: " + ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_bjdyrzList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","ip","yhdlm","yhmc","dysj","tcsj"};
	pageObj.setDisColName(disColName);
*/

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
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
  <B><font size="3">���ӱ��۴�ӡ��־</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="17%">���ӡʱ��</td>
	<td  width="13%">IP��ַ</td>
	<td  width="8%">�ͻ����</td>
	<td  width="8%">�ͻ�����</td>
	<td  width="10%">��ͬ��</td>
	<td  width="10%">�û���½��</td>
	<td  width="8%">�û�����</td>
	<td  width="14%">��������</td>
	<td  width="12%">�����ֹ�˾</td>
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