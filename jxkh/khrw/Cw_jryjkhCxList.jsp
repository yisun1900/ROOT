<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String khzq=null;
	String ssfgs=null;
	String dwbh=null;
	String cw_jryjkh_yhmc=null;
	khzq=request.getParameter("khzq");
	if (khzq!=null)
	{
		khzq=cf.GB2Uni(khzq);
		if (!(khzq.equals("")))	wheresql+=" and  (cw_jryjkh.khzq='"+khzq+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (cw_jryjkh.fgsbh='"+ssfgs+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cw_jryjkh.dwbh='"+dwbh+"')";
	}
	cw_jryjkh_yhmc=request.getParameter("cw_jryjkh_yhmc");
	if (cw_jryjkh_yhmc!=null)
	{
		cw_jryjkh_yhmc=cf.GB2Uni(cw_jryjkh_yhmc);
		if (!(cw_jryjkh_yhmc.equals("")))	wheresql+=" and  (cw_jryjkh.yhmc='"+cw_jryjkh_yhmc+"')";
	}
	ls_sql="SELECT cw_jryjkh.khzq,cw_jryjkh.khqssj,cw_jryjkh.khjzsj,a.dwmc fgs,b.dwmc,cw_jryjkh.ygbh,cw_jryjkh.bianhao,cw_jryjkh.yhmc,cw_jryjkh.xzzwbm,cw_jryjkh.byrw,cw_jryjkh.lrr,cw_jryjkh.lrsj,cw_jryjkh.bz  ";
	ls_sql+=" FROM cw_jryjkh,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where cw_jryjkh.fgsbh=a.dwbh(+)";
    ls_sql+=" and cw_jryjkh.dwbh=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and cw_jryjkh.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_jryjkh.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jryjkh.khzq,cw_jryjkh.fgsbh,cw_jryjkh.dwbh,cw_jryjkh.zw,cw_jryjkh.yhmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jryjkhCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khzq","cw_jryjkh_khqssj","cw_jryjkh_khjzsj","ssfgs","dwbh","sq_dwxx_dwmc","yhmc","cw_jryjkh_zw","cw_jryjkh_byrw","cw_jryjkh_byqds","cw_jryjkh_byyj","cw_jryjkh_dzkhbl","cw_jryjkh_lrr","cw_jryjkh_lrsj","cw_jryjkh_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khzq","ygbh"};
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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�������񣭲�ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">��������</td>
	<td  width="6%">������ʼʱ��</td>
	<td  width="6%">���˽���ʱ��</td>
	<td  width="8%">�ֹ�˾</td>
	<td  width="8%">��������</td>
	<td  width="5%">Ա�����</td>
	<td  width="6%">����</td>
	<td  width="5%">����</td>
	<td  width="6%">ְ��</td>
	<td  width="7%">��������</td>
	<td  width="5%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="22%">��ע</td>
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