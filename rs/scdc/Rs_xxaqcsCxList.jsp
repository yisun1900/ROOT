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
	String rs_xxaqcs_wtbh=null;
	String rs_xxaqcs_wt=null;
	String rs_xxaqcs_dabh=null;
	String rs_xxaqcs_da=null;
	String rs_xxaqcs_ygbh=null;
	String rs_xxaqcs_yhmc=null;
	String rs_xxaqcs_lrsj=null;
	String rs_xxaqcs_lrbm=null;
	String rs_xxaqcs_ssfgs=null;
	rs_xxaqcs_wtbh=request.getParameter("rs_xxaqcs_wtbh");
	if (rs_xxaqcs_wtbh!=null)
	{
		rs_xxaqcs_wtbh=cf.GB2Uni(rs_xxaqcs_wtbh);
		if (!(rs_xxaqcs_wtbh.equals("")))	wheresql+=" and  (rs_xxaqcs.wtbh='"+rs_xxaqcs_wtbh+"')";
	}
	rs_xxaqcs_wt=request.getParameter("rs_xxaqcs_wt");
	if (rs_xxaqcs_wt!=null)
	{
		rs_xxaqcs_wt=cf.GB2Uni(rs_xxaqcs_wt);
		if (!(rs_xxaqcs_wt.equals("")))	wheresql+=" and  (rs_xxaqcs.wt='"+rs_xxaqcs_wt+"')";
	}
	rs_xxaqcs_dabh=request.getParameter("rs_xxaqcs_dabh");
	if (rs_xxaqcs_dabh!=null)
	{
		rs_xxaqcs_dabh=cf.GB2Uni(rs_xxaqcs_dabh);
		if (!(rs_xxaqcs_dabh.equals("")))	wheresql+=" and  (rs_xxaqcs.dabh='"+rs_xxaqcs_dabh+"')";
	}
	rs_xxaqcs_da=request.getParameter("rs_xxaqcs_da");
	if (rs_xxaqcs_da!=null)
	{
		rs_xxaqcs_da=cf.GB2Uni(rs_xxaqcs_da);
		if (!(rs_xxaqcs_da.equals("")))	wheresql+=" and  (rs_xxaqcs.da='"+rs_xxaqcs_da+"')";
	}
	rs_xxaqcs_ygbh=request.getParameter("rs_xxaqcs_ygbh");
	if (rs_xxaqcs_ygbh!=null)
	{
		rs_xxaqcs_ygbh=rs_xxaqcs_ygbh.trim();
		if (!(rs_xxaqcs_ygbh.equals("")))	wheresql+=" and (rs_xxaqcs.ygbh="+rs_xxaqcs_ygbh+") ";
	}
	rs_xxaqcs_yhmc=request.getParameter("rs_xxaqcs_yhmc");
	if (rs_xxaqcs_yhmc!=null)
	{
		rs_xxaqcs_yhmc=cf.GB2Uni(rs_xxaqcs_yhmc);
		if (!(rs_xxaqcs_yhmc.equals("")))	wheresql+=" and  (rs_xxaqcs.yhmc='"+rs_xxaqcs_yhmc+"')";
	}
	rs_xxaqcs_lrsj=request.getParameter("rs_xxaqcs_lrsj");
	if (rs_xxaqcs_lrsj!=null)
	{
		rs_xxaqcs_lrsj=rs_xxaqcs_lrsj.trim();
		if (!(rs_xxaqcs_lrsj.equals("")))	wheresql+="  and (rs_xxaqcs.lrsj=TO_DATE('"+rs_xxaqcs_lrsj+"','YYYY/MM/DD'))";
	}
	rs_xxaqcs_lrbm=request.getParameter("rs_xxaqcs_lrbm");
	if (rs_xxaqcs_lrbm!=null)
	{
		rs_xxaqcs_lrbm=cf.GB2Uni(rs_xxaqcs_lrbm);
		if (!(rs_xxaqcs_lrbm.equals("")))	wheresql+=" and  (rs_xxaqcs.lrbm='"+rs_xxaqcs_lrbm+"')";
	}
	rs_xxaqcs_ssfgs=request.getParameter("rs_xxaqcs_ssfgs");
	if (rs_xxaqcs_ssfgs!=null)
	{
		rs_xxaqcs_ssfgs=cf.GB2Uni(rs_xxaqcs_ssfgs);
		if (!(rs_xxaqcs_ssfgs.equals("")))	wheresql+=" and  (rs_xxaqcs.ssfgs='"+rs_xxaqcs_ssfgs+"')";
	}
	String myxssl=null;
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	myxssl=request.getParameter("myxssl");
	ls_sql="SELECT rs_xxaqcs.wtbh,rs_xxaqcs.wt,rs_xxaqcs.dabh,rs_xxaqcs.da,rs_xxaqcs.ygbh,rs_xxaqcs.yhmc,rs_xxaqcs.lrsj,sq_dwxx.dwmc ,rs_xxaqcs.bz  ";
	ls_sql+=" FROM sq_dwxx,rs_xxaqcs  ";
    ls_sql+=" where rs_xxaqcs.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_xxaqcs.ssfgs,rs_xxaqcs.lrbm,rs_xxaqcs.yhmc,rs_xxaqcs.wtbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_xxaqcsCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"wtbh","rs_xxaqcs_wt","rs_xxaqcs_dabh","rs_xxaqcs_da","ygbh","rs_xxaqcs_yhmc","rs_xxaqcs_lrsj","sq_dwxx_dwmc","rs_xxaqcs_ssfgs","rs_xxaqcs_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"wtbh","ygbh"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��Ϣ��ȫ���Բ�ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">������</td>
	<td  width="24%">����</td>
	<td  width="4%">�𰸱��</td>
	<td  width="24%">��</td>
	<td  width="4%">Ա�����</td>
	<td  width="6%">Ա������</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="10%">¼�벿��</td>

	<td  width="10%">��ע</td>
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