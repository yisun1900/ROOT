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
	String cw_jxkkbl_xuhao=null;
	String cw_jxkkbl_mc=null;
	String cw_jxkkbl_qd=null;
	String cw_jxkkbl_zd=null;
	String cw_jxkkbl_bfb=null;
	String cw_jxkkbl_fgsbh=null;
	cw_jxkkbl_xuhao=request.getParameter("cw_jxkkbl_xuhao");
	if (cw_jxkkbl_xuhao!=null)
	{
		cw_jxkkbl_xuhao=cw_jxkkbl_xuhao.trim();
		if (!(cw_jxkkbl_xuhao.equals("")))	wheresql+=" and (cw_jxkkbl.xuhao="+cw_jxkkbl_xuhao+") ";
	}
	cw_jxkkbl_mc=request.getParameter("cw_jxkkbl_mc");
	if (cw_jxkkbl_mc!=null)
	{
		cw_jxkkbl_mc=cf.GB2Uni(cw_jxkkbl_mc);
		if (!(cw_jxkkbl_mc.equals("")))	wheresql+=" and  (cw_jxkkbl.mc='"+cw_jxkkbl_mc+"')";
	}
	cw_jxkkbl_qd=request.getParameter("cw_jxkkbl_qd");
	if (cw_jxkkbl_qd!=null)
	{
		cw_jxkkbl_qd=cw_jxkkbl_qd.trim();
		if (!(cw_jxkkbl_qd.equals("")))	wheresql+=" and  (cw_jxkkbl.qd="+cw_jxkkbl_qd+") ";
	}
	cw_jxkkbl_zd=request.getParameter("cw_jxkkbl_zd");
	if (cw_jxkkbl_zd!=null)
	{
		cw_jxkkbl_zd=cw_jxkkbl_zd.trim();
		if (!(cw_jxkkbl_zd.equals("")))	wheresql+=" and  (cw_jxkkbl.zd="+cw_jxkkbl_zd+") ";
	}
	cw_jxkkbl_bfb=request.getParameter("cw_jxkkbl_bfb");
	if (cw_jxkkbl_bfb!=null)
	{
		cw_jxkkbl_bfb=cw_jxkkbl_bfb.trim();
		if (!(cw_jxkkbl_bfb.equals("")))	wheresql+=" and  (cw_jxkkbl.bfb="+cw_jxkkbl_bfb+") ";
	}
	cw_jxkkbl_fgsbh=request.getParameter("cw_jxkkbl_fgsbh");
	if (cw_jxkkbl_fgsbh!=null)
	{
		cw_jxkkbl_fgsbh=cf.GB2Uni(cw_jxkkbl_fgsbh);
		if (!(cw_jxkkbl_fgsbh.equals("")))	wheresql+=" and  (cw_jxkkbl.fgsbh='"+cw_jxkkbl_fgsbh+"')";
	}
	ls_sql="SELECT cw_jxkkbl.xuhao,cw_jxkkbl.mc,cw_jxkkbl.qd||'%',cw_jxkkbl.zd||'%',cw_jxkkbl.bfb||'%',sq_dwxx.dwmc  ";
	ls_sql+=" FROM cw_jxkkbl,sq_dwxx  ";
    ls_sql+=" where cw_jxkkbl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jxkkbl.xuhao";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jxkkblList.jsp","SelectCw_jxkkbl.jsp","","EditCw_jxkkbl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xuhao","cw_jxkkbl_mc","cw_jxkkbl_qd","cw_jxkkbl_zd","cw_jxkkbl_bfb","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xuhao"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_jxkkblList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] xuhao = request.getParameterValues("xuhao");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xuhao,"xuhao"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_jxkkbl where "+chooseitem;
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
	<td  width="10%">&nbsp;</td>
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