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
	String kp_gckpxm_kpxmbm=null;
	String kp_gckpxm_kpxmmc=null;
	String kp_gckpxm_kpdlbm=null;
	String kp_gckpxm_kpjg=null;
	String kp_gckpxm_kpjgdy=null;
	String kp_gckpxm_kpcfbm=null;

	String kf=null;
	kf=request.getParameter("kf");
	if (kf!=null)
	{
		kf=cf.GB2Uni(kf);
		if (!(kf.equals("")))	wheresql+=" and  (kp_gckpxm.kf="+kf+")";
	}
	String sgdfk=null;
	sgdfk=request.getParameter("sgdfk");
	if (sgdfk!=null)
	{
		sgdfk=cf.GB2Uni(sgdfk);
		if (!(sgdfk.equals("")))	wheresql+=" and  (kp_gckpxm.sgdfk="+sgdfk+")";
	}
	String kcjdebl=null;
	kcjdebl=request.getParameter("kcjdebl");
	if (kcjdebl!=null)
	{
		kcjdebl=cf.GB2Uni(kcjdebl);
		if (!(kcjdebl.equals("")))	wheresql+=" and  (kp_gckpxm.kcjdebl="+kcjdebl+")";
	}

	
	kp_gckpxm_kpxmbm=request.getParameter("kp_gckpxm_kpxmbm");
	if (kp_gckpxm_kpxmbm!=null)
	{
		kp_gckpxm_kpxmbm=cf.GB2Uni(kp_gckpxm_kpxmbm);
		if (!(kp_gckpxm_kpxmbm.equals("")))	wheresql+=" and  (kp_gckpxm.kpxmbm='"+kp_gckpxm_kpxmbm+"')";
	}
	kp_gckpxm_kpxmmc=request.getParameter("kp_gckpxm_kpxmmc");
	if (kp_gckpxm_kpxmmc!=null)
	{
		kp_gckpxm_kpxmmc=cf.GB2Uni(kp_gckpxm_kpxmmc);
		if (!(kp_gckpxm_kpxmmc.equals("")))	wheresql+=" and  (kp_gckpxm.kpxmmc='"+kp_gckpxm_kpxmmc+"')";
	}
	kp_gckpxm_kpdlbm=request.getParameter("kp_gckpxm_kpdlbm");
	if (kp_gckpxm_kpdlbm!=null)
	{
		kp_gckpxm_kpdlbm=cf.GB2Uni(kp_gckpxm_kpdlbm);
		if (!(kp_gckpxm_kpdlbm.equals("")))	wheresql+=" and  (kp_gckpxm.kpdlbm='"+kp_gckpxm_kpdlbm+"')";
	}
	kp_gckpxm_kpjg=request.getParameter("kp_gckpxm_kpjg");
	if (kp_gckpxm_kpjg!=null)
	{
		kp_gckpxm_kpjg=cf.GB2Uni(kp_gckpxm_kpjg);
		if (!(kp_gckpxm_kpjg.equals("")))	wheresql+=" and  (kp_gckpxm.kpjg='"+kp_gckpxm_kpjg+"')";
	}
	kp_gckpxm_kpjgdy=request.getParameter("kp_gckpxm_kpjgdy");
	if (kp_gckpxm_kpjgdy!=null)
	{
		kp_gckpxm_kpjgdy=cf.GB2Uni(kp_gckpxm_kpjgdy);
		if (!(kp_gckpxm_kpjgdy.equals("")))	wheresql+=" and  (kp_gckpxm.kpjgdy='"+kp_gckpxm_kpjgdy+"')";
	}
	kp_gckpxm_kpcfbm=request.getParameter("kp_gckpxm_kpcfbm");
	if (kp_gckpxm_kpcfbm!=null)
	{
		kp_gckpxm_kpcfbm=cf.GB2Uni(kp_gckpxm_kpcfbm);
		if (!(kp_gckpxm_kpcfbm.equals("")))	wheresql+=" and  (kp_gckpxm.kpcfbm='"+kp_gckpxm_kpcfbm+"')";
	}
	ls_sql="SELECT kp_kpdlbm.kpdlmc,kp_gckpxm.kpxmbm,kp_gckpxm.kpxmmc,ydcdmc,kp_gckpxm.kpjgdy,kf,sgdfk,kcjdebl||'%' kcjdebl,kp_kpcfbm.kpcfmc,kp_gckpxm.cfbz  ";
	ls_sql+=" FROM kp_gckpxm,kp_kpcfbm,kp_kpdlbm,kp_sgdyzcdbm  ";
    ls_sql+=" where kp_gckpxm.kpcfbm=kp_kpcfbm.kpcfbm(+) ";
    ls_sql+=" and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm(+) and kp_gckpxm.kpjg=kp_sgdyzcdbm.yzcdbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_gckpxm.kpxmbm,kp_gckpxm.kpjg";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_gckpxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"kpxmbm","kp_gckpxm_kpxmmc","kp_kpdlbm_kpdlmc","kpjg","kp_gckpxm_kpjgdy","kp_kpkfbm_kpkfmc","kp_kpcfbm_kpcfmc"};
	pageObj.setDisColName(disColName);
*/


//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("kpdlmc","1");//�в����������Hash��
	spanColHash.put("kpxmbm","1");//�в����������Hash��
	spanColHash.put("kpxmmc","1");//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">��Ŀ����</td>
	<td  width="6%">Υ����Ŀ����</td>
	<td  width="16%">Υ����Ŀ����</td>
	<td  width="4%">Υ��ּ�</td>
	<td  width="24%">Υ��ּ�����</td>
	<td  width="4%">�۷�</td>
	<td  width="4%">����</td>
	<td  width="4%">�۳��ӵ���ٷֱ�</td>
	<td  width="6%">��������</td>
	<td  width="24%">������׼</td>
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