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
	String cw_zxjlbl_xuhao=null;
	String cw_zxjlbl_mc=null;
	String cw_zxjlbl_qd=null;
	String cw_zxjlbl_zd=null;
	String cw_zxjlbl_bfb=null;
	String cw_zxjlbl_fgsbh=null;
	cw_zxjlbl_xuhao=request.getParameter("cw_zxjlbl_xuhao");
	if (cw_zxjlbl_xuhao!=null)
	{
		cw_zxjlbl_xuhao=cw_zxjlbl_xuhao.trim();
		if (!(cw_zxjlbl_xuhao.equals("")))	wheresql+=" and (cw_zxjlbl.xuhao="+cw_zxjlbl_xuhao+") ";
	}
	cw_zxjlbl_mc=request.getParameter("cw_zxjlbl_mc");
	if (cw_zxjlbl_mc!=null)
	{
		cw_zxjlbl_mc=cf.GB2Uni(cw_zxjlbl_mc);
		if (!(cw_zxjlbl_mc.equals("")))	wheresql+=" and  (cw_zxjlbl.mc='"+cw_zxjlbl_mc+"')";
	}
	cw_zxjlbl_qd=request.getParameter("cw_zxjlbl_qd");
	if (cw_zxjlbl_qd!=null)
	{
		cw_zxjlbl_qd=cw_zxjlbl_qd.trim();
		if (!(cw_zxjlbl_qd.equals("")))	wheresql+=" and  (cw_zxjlbl.qd="+cw_zxjlbl_qd+") ";
	}
	cw_zxjlbl_zd=request.getParameter("cw_zxjlbl_zd");
	if (cw_zxjlbl_zd!=null)
	{
		cw_zxjlbl_zd=cw_zxjlbl_zd.trim();
		if (!(cw_zxjlbl_zd.equals("")))	wheresql+=" and  (cw_zxjlbl.zd="+cw_zxjlbl_zd+") ";
	}
	cw_zxjlbl_bfb=request.getParameter("cw_zxjlbl_bfb");
	if (cw_zxjlbl_bfb!=null)
	{
		cw_zxjlbl_bfb=cw_zxjlbl_bfb.trim();
		if (!(cw_zxjlbl_bfb.equals("")))	wheresql+=" and  (cw_zxjlbl.bfb="+cw_zxjlbl_bfb+") ";
	}
	cw_zxjlbl_fgsbh=request.getParameter("cw_zxjlbl_fgsbh");
	if (cw_zxjlbl_fgsbh!=null)
	{
		cw_zxjlbl_fgsbh=cf.GB2Uni(cw_zxjlbl_fgsbh);
		if (!(cw_zxjlbl_fgsbh.equals("")))	wheresql+=" and  (cw_zxjlbl.fgsbh='"+cw_zxjlbl_fgsbh+"')";
	}
	ls_sql="SELECT cw_zxjlbl.xuhao,cw_zxjlbl.mc,cw_zxjlbl.qd||'%',cw_zxjlbl.zd||'%',cw_zxjlbl.bfb||'%',sq_dwxx.dwmc  ";
	ls_sql+=" FROM cw_zxjlbl,sq_dwxx  ";
    ls_sql+=" where cw_zxjlbl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zxjlbl.fgsbh,cw_zxjlbl.xuhao";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_zxjlblCxList.jsp","SelectCxCw_zxjlbl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xuhao","cw_zxjlbl_mc","cw_zxjlbl_qd","cw_zxjlbl_zd","cw_zxjlbl_bfb","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xuhao"};
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
	<td  width="10%">���</td>
	<td  width="35%">����</td>
	<td  width="10%">���ٷֱȣ�>=��</td>
	<td  width="10%">�յ�ٷֱȣ�<��</td>
	<td  width="10%">�����ٷֱ�</td>
	<td  width="15%">�ֹ�˾</td>
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