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
	String cw_kzbjbl_xuhao=null;
	String cw_kzbjbl_mc=null;
	String cw_kzbjbl_qd=null;
	String cw_kzbjbl_zd=null;
	String cw_kzbjbl_bfb=null;
	String cw_kzbjbl_fgsbh=null;
	cw_kzbjbl_xuhao=request.getParameter("cw_kzbjbl_xuhao");
	if (cw_kzbjbl_xuhao!=null)
	{
		cw_kzbjbl_xuhao=cw_kzbjbl_xuhao.trim();
		if (!(cw_kzbjbl_xuhao.equals("")))	wheresql+=" and (cw_kzbjbl.xuhao="+cw_kzbjbl_xuhao+") ";
	}
	cw_kzbjbl_mc=request.getParameter("cw_kzbjbl_mc");
	if (cw_kzbjbl_mc!=null)
	{
		cw_kzbjbl_mc=cf.GB2Uni(cw_kzbjbl_mc);
		if (!(cw_kzbjbl_mc.equals("")))	wheresql+=" and  (cw_kzbjbl.mc='"+cw_kzbjbl_mc+"')";
	}
	cw_kzbjbl_qd=request.getParameter("cw_kzbjbl_qd");
	if (cw_kzbjbl_qd!=null)
	{
		cw_kzbjbl_qd=cw_kzbjbl_qd.trim();
		if (!(cw_kzbjbl_qd.equals("")))	wheresql+=" and  (cw_kzbjbl.qd="+cw_kzbjbl_qd+") ";
	}
	cw_kzbjbl_zd=request.getParameter("cw_kzbjbl_zd");
	if (cw_kzbjbl_zd!=null)
	{
		cw_kzbjbl_zd=cw_kzbjbl_zd.trim();
		if (!(cw_kzbjbl_zd.equals("")))	wheresql+=" and  (cw_kzbjbl.zd="+cw_kzbjbl_zd+") ";
	}
	cw_kzbjbl_bfb=request.getParameter("cw_kzbjbl_bfb");
	if (cw_kzbjbl_bfb!=null)
	{
		cw_kzbjbl_bfb=cw_kzbjbl_bfb.trim();
		if (!(cw_kzbjbl_bfb.equals("")))	wheresql+=" and  (cw_kzbjbl.bfb="+cw_kzbjbl_bfb+") ";
	}
	cw_kzbjbl_fgsbh=request.getParameter("cw_kzbjbl_fgsbh");
	if (cw_kzbjbl_fgsbh!=null)
	{
		cw_kzbjbl_fgsbh=cf.GB2Uni(cw_kzbjbl_fgsbh);
		if (!(cw_kzbjbl_fgsbh.equals("")))	wheresql+=" and  (cw_kzbjbl.fgsbh='"+cw_kzbjbl_fgsbh+"')";
	}
	ls_sql="SELECT cw_kzbjbl.xuhao,cw_kzbjbl.mc,cw_kzbjbl.qd,cw_kzbjbl.zd,cw_kzbjbl.bfb||'%',sq_dwxx.dwmc  ";
	ls_sql+=" FROM sq_dwxx,cw_kzbjbl  ";
    ls_sql+=" where cw_kzbjbl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_kzbjbl.fgsbh,cw_kzbjbl.xuhao";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_kzbjblCxList.jsp","SelectCxCw_kzbjbl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xuhao","cw_kzbjbl_mc","cw_kzbjbl_qd","cw_kzbjbl_zd","cw_kzbjbl_bfb","sq_dwxx_dwmc"};
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
	<td  width="6%">���</td>
	<td  width="25%">����</td>
	<td  width="15%">����>=��</td>
	<td  width="15%">�յ��<��</td>
	<td  width="8%">�۳��ٷֱ�</td>
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