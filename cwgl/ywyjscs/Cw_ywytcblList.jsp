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
	String cw_ywytcbl_xh=null;
	String cw_ywytcbl_fdmc=null;
	String cw_ywytcbl_qd=null;
	String cw_ywytcbl_zd=null;
	String cw_ywytcbl_tcbfb=null;
	String cw_ywytcbl_qdlx=null;
	String cw_ywytcbl_fgsbh=null;
	cw_ywytcbl_xh=request.getParameter("cw_ywytcbl_xh");
	if (cw_ywytcbl_xh!=null)
	{
		cw_ywytcbl_xh=cw_ywytcbl_xh.trim();
		if (!(cw_ywytcbl_xh.equals("")))	wheresql+=" and (cw_ywytcbl.xh="+cw_ywytcbl_xh+") ";
	}
	cw_ywytcbl_fdmc=request.getParameter("cw_ywytcbl_fdmc");
	if (cw_ywytcbl_fdmc!=null)
	{
		cw_ywytcbl_fdmc=cf.GB2Uni(cw_ywytcbl_fdmc);
		if (!(cw_ywytcbl_fdmc.equals("")))	wheresql+=" and  (cw_ywytcbl.fdmc='"+cw_ywytcbl_fdmc+"')";
	}
	cw_ywytcbl_qd=request.getParameter("cw_ywytcbl_qd");
	if (cw_ywytcbl_qd!=null)
	{
		cw_ywytcbl_qd=cw_ywytcbl_qd.trim();
		if (!(cw_ywytcbl_qd.equals("")))	wheresql+=" and  (cw_ywytcbl.qd="+cw_ywytcbl_qd+") ";
	}
	cw_ywytcbl_zd=request.getParameter("cw_ywytcbl_zd");
	if (cw_ywytcbl_zd!=null)
	{
		cw_ywytcbl_zd=cw_ywytcbl_zd.trim();
		if (!(cw_ywytcbl_zd.equals("")))	wheresql+=" and  (cw_ywytcbl.zd="+cw_ywytcbl_zd+") ";
	}
	cw_ywytcbl_tcbfb=request.getParameter("cw_ywytcbl_tcbfb");
	if (cw_ywytcbl_tcbfb!=null)
	{
		cw_ywytcbl_tcbfb=cw_ywytcbl_tcbfb.trim();
		if (!(cw_ywytcbl_tcbfb.equals("")))	wheresql+=" and  (cw_ywytcbl.tcbfb="+cw_ywytcbl_tcbfb+") ";
	}
	cw_ywytcbl_qdlx=request.getParameter("cw_ywytcbl_qdlx");
	if (cw_ywytcbl_qdlx!=null)
	{
		cw_ywytcbl_qdlx=cf.GB2Uni(cw_ywytcbl_qdlx);
		if (!(cw_ywytcbl_qdlx.equals("")))	wheresql+=" and  (cw_ywytcbl.qdlx='"+cw_ywytcbl_qdlx+"')";
	}
	cw_ywytcbl_fgsbh=request.getParameter("cw_ywytcbl_fgsbh");
	if (cw_ywytcbl_fgsbh!=null)
	{
		cw_ywytcbl_fgsbh=cf.GB2Uni(cw_ywytcbl_fgsbh);
		if (!(cw_ywytcbl_fgsbh.equals("")))	wheresql+=" and  (cw_ywytcbl.fgsbh='"+cw_ywytcbl_fgsbh+"')";
	}
	ls_sql="SELECT cw_ywytcbl.xh,cw_ywytcbl.fdmc,cw_ywytcbl.qd,cw_ywytcbl.zd,cw_ywytcbl.tcbfb, DECODE(cw_ywytcbl.qdlx,'1','��װ','3','��װ'),cw_ywytcbl.fgsbh,sq_dwxx.dwmc  ";
	ls_sql+=" FROM sq_dwxx,cw_ywytcbl  ";
    ls_sql+=" where cw_ywytcbl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_ywytcblList.jsp","SelectCw_ywytcbl.jsp","","EditCw_ywytcbl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","cw_ywytcbl_fdmc","cw_ywytcbl_qd","cw_ywytcbl_zd","cw_ywytcbl_tcbfb","cw_ywytcbl_qdlx","cw_ywytcbl_fgsbh","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_ywytcblList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_ywytcbl where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="11%">���</td>
	<td  width="11%">�ֶ�����</td>
	<td  width="11%">��㣨>��</td>
	<td  width="11%">�յ㣨<=��</td>
	<td  width="11%">��ɰٷֱ�</td>
	<td  width="11%">ǩ������</td>
	<td  width="11%">�ֹ�˾</td>
	<td  width="11%">�ֹ�˾</td>
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