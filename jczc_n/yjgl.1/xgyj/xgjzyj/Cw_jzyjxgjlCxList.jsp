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
	String cw_jzyjxgjl_khbh=null;
	String crm_khxx_sjs=null;
	String cw_jzyjxgjl_xgsj=null;
	String cw_jzyjxgjl_xgr=null;
	String cw_jzyjxgjl_zt=null;
	String cw_jzyjxgjl_hth=null;
	String cw_jzyjxgjl_khxm=null;
	String cw_jzyjxgjl_xglx=null;
	String cw_jzyjxgjl_yjzrq=null;
	String cw_jzyjxgjl_ywdzgce=null;
	String cw_jzyjxgjl_yqye=null;
	String cw_jzyjxgjl_xjzrq=null;
	String cw_jzyjxgjl_xwdzgce=null;
	String cw_jzyjxgjl_xqye=null;
	cw_jzyjxgjl_khbh=request.getParameter("cw_jzyjxgjl_khbh");
	if (cw_jzyjxgjl_khbh!=null)
	{
		cw_jzyjxgjl_khbh=cf.GB2Uni(cw_jzyjxgjl_khbh);
		if (!(cw_jzyjxgjl_khbh.equals("")))	wheresql+=" and  (cw_jzyjxgjl.khbh='"+cw_jzyjxgjl_khbh+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	cw_jzyjxgjl_xgsj=request.getParameter("cw_jzyjxgjl_xgsj");
	if (cw_jzyjxgjl_xgsj!=null)
	{
		cw_jzyjxgjl_xgsj=cw_jzyjxgjl_xgsj.trim();
		if (!(cw_jzyjxgjl_xgsj.equals("")))	wheresql+="  and (cw_jzyjxgjl.xgsj>=TO_DATE('"+cw_jzyjxgjl_xgsj+"','YYYY/MM/DD'))";
	}
	cw_jzyjxgjl_xgsj=request.getParameter("cw_jzyjxgjl_xgsj2");
	if (cw_jzyjxgjl_xgsj!=null)
	{
		cw_jzyjxgjl_xgsj=cw_jzyjxgjl_xgsj.trim();
		if (!(cw_jzyjxgjl_xgsj.equals("")))	wheresql+="  and (cw_jzyjxgjl.xgsj<=TO_DATE('"+cw_jzyjxgjl_xgsj+"','YYYY/MM/DD'))";
	}
	cw_jzyjxgjl_xgr=request.getParameter("cw_jzyjxgjl_xgr");
	if (cw_jzyjxgjl_xgr!=null)
	{
		cw_jzyjxgjl_xgr=cf.GB2Uni(cw_jzyjxgjl_xgr);
		if (!(cw_jzyjxgjl_xgr.equals("")))	wheresql+=" and  (cw_jzyjxgjl.xgr='"+cw_jzyjxgjl_xgr+"')";
	}
	cw_jzyjxgjl_zt=request.getParameter("cw_jzyjxgjl_zt");
	if (cw_jzyjxgjl_zt!=null)
	{
		cw_jzyjxgjl_zt=cf.GB2Uni(cw_jzyjxgjl_zt);
		if (!(cw_jzyjxgjl_zt.equals("")))	wheresql+=" and  (cw_jzyjxgjl.zt='"+cw_jzyjxgjl_zt+"')";
	}
	cw_jzyjxgjl_hth=request.getParameter("cw_jzyjxgjl_hth");
	if (cw_jzyjxgjl_hth!=null)
	{
		cw_jzyjxgjl_hth=cf.GB2Uni(cw_jzyjxgjl_hth);
		if (!(cw_jzyjxgjl_hth.equals("")))	wheresql+=" and  (cw_jzyjxgjl.hth='"+cw_jzyjxgjl_hth+"')";
	}
	cw_jzyjxgjl_khxm=request.getParameter("cw_jzyjxgjl_khxm");
	if (cw_jzyjxgjl_khxm!=null)
	{
		cw_jzyjxgjl_khxm=cf.GB2Uni(cw_jzyjxgjl_khxm);
		if (!(cw_jzyjxgjl_khxm.equals("")))	wheresql+=" and  (cw_jzyjxgjl.khxm='"+cw_jzyjxgjl_khxm+"')";
	}
	cw_jzyjxgjl_xglx=request.getParameter("cw_jzyjxgjl_xglx");
	if (cw_jzyjxgjl_xglx!=null)
	{
		cw_jzyjxgjl_xglx=cf.GB2Uni(cw_jzyjxgjl_xglx);
		if (!(cw_jzyjxgjl_xglx.equals("")))	wheresql+=" and  (cw_jzyjxgjl.xglx='"+cw_jzyjxgjl_xglx+"')";
	}
	cw_jzyjxgjl_yjzrq=request.getParameter("cw_jzyjxgjl_yjzrq");
	if (cw_jzyjxgjl_yjzrq!=null)
	{
		cw_jzyjxgjl_yjzrq=cw_jzyjxgjl_yjzrq.trim();
		if (!(cw_jzyjxgjl_yjzrq.equals("")))	wheresql+="  and (cw_jzyjxgjl.yjzrq=TO_DATE('"+cw_jzyjxgjl_yjzrq+"','YYYY/MM/DD'))";
	}
	cw_jzyjxgjl_ywdzgce=request.getParameter("cw_jzyjxgjl_ywdzgce");
	if (cw_jzyjxgjl_ywdzgce!=null)
	{
		cw_jzyjxgjl_ywdzgce=cw_jzyjxgjl_ywdzgce.trim();
		if (!(cw_jzyjxgjl_ywdzgce.equals("")))	wheresql+=" and  (cw_jzyjxgjl.ywdzgce="+cw_jzyjxgjl_ywdzgce+") ";
	}
	cw_jzyjxgjl_yqye=request.getParameter("cw_jzyjxgjl_yqye");
	if (cw_jzyjxgjl_yqye!=null)
	{
		cw_jzyjxgjl_yqye=cw_jzyjxgjl_yqye.trim();
		if (!(cw_jzyjxgjl_yqye.equals("")))	wheresql+=" and  (cw_jzyjxgjl.yqye="+cw_jzyjxgjl_yqye+") ";
	}
	cw_jzyjxgjl_xjzrq=request.getParameter("cw_jzyjxgjl_xjzrq");
	if (cw_jzyjxgjl_xjzrq!=null)
	{
		cw_jzyjxgjl_xjzrq=cw_jzyjxgjl_xjzrq.trim();
		if (!(cw_jzyjxgjl_xjzrq.equals("")))	wheresql+="  and (cw_jzyjxgjl.xjzrq=TO_DATE('"+cw_jzyjxgjl_xjzrq+"','YYYY/MM/DD'))";
	}
	cw_jzyjxgjl_xwdzgce=request.getParameter("cw_jzyjxgjl_xwdzgce");
	if (cw_jzyjxgjl_xwdzgce!=null)
	{
		cw_jzyjxgjl_xwdzgce=cw_jzyjxgjl_xwdzgce.trim();
		if (!(cw_jzyjxgjl_xwdzgce.equals("")))	wheresql+=" and  (cw_jzyjxgjl.xwdzgce="+cw_jzyjxgjl_xwdzgce+") ";
	}
	cw_jzyjxgjl_xqye=request.getParameter("cw_jzyjxgjl_xqye");
	if (cw_jzyjxgjl_xqye!=null)
	{
		cw_jzyjxgjl_xqye=cw_jzyjxgjl_xqye.trim();
		if (!(cw_jzyjxgjl_xqye.equals("")))	wheresql+=" and  (cw_jzyjxgjl.xqye="+cw_jzyjxgjl_xqye+") ";
	}
	ls_sql="SELECT cw_jzyjxgjl.khbh,crm_khxx.sjs,cw_jzyjxgjl.xgsj,cw_jzyjxgjl.xgr, DECODE(cw_jzyjxgjl.zt,'2','��װ�ͻ�','3','�˵��ͻ�','4','���ɿͻ�','5','��ƿͻ�'),cw_jzyjxgjl.hth,cw_jzyjxgjl.khxm, DECODE(cw_jzyjxgjl.xglx,'1','�޸�','2','ɾ��','3','����'),cw_jzyjxgjl.yjzrq,cw_jzyjxgjl.ywdzgce,cw_jzyjxgjl.yqye,cw_jzyjxgjl.xjzrq,cw_jzyjxgjl.xwdzgce,cw_jzyjxgjl.xqye  ";
	ls_sql+=" FROM crm_khxx,cw_jzyjxgjl  ";
    ls_sql+=" where cw_jzyjxgjl.khbh=crm_khxx.khbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jzyjxgjlCxList.jsp","SelectCxCw_jzyjxgjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_sjs","xgsj","cw_jzyjxgjl_xgr","cw_jzyjxgjl_zt","cw_jzyjxgjl_hth","cw_jzyjxgjl_khxm","cw_jzyjxgjl_xglx","cw_jzyjxgjl_yjzrq","cw_jzyjxgjl_ywdzgce","cw_jzyjxgjl_yqye","cw_jzyjxgjl_xjzrq","cw_jzyjxgjl_xwdzgce","cw_jzyjxgjl_xqye"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh","xgsj"};
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�ͻ����</td>
	<td  width="7%">���ʦ</td>
	<td  width="7%">�޸�ʱ��</td>
	<td  width="7%">�޸���</td>
	<td  width="7%">�ͻ�����</td>
	<td  width="7%">��ͬ��</td>
	<td  width="7%">�ͻ�����</td>
	<td  width="7%">�޸�����</td>
	<td  width="7%">ԭҵ����תʱ��</td>
	<td  width="7%">ԭ��ͬԭ����</td>
	<td  width="7%">ԭ����ǩԼ��</td>
	<td  width="7%">�޸ĺ�ҵ����תʱ��</td>
	<td  width="7%">�޸ĺ��ͬԭ����</td>
	<td  width="7%">�޸ĺ󹤳�ǩԼ��</td>
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