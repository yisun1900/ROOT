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
	String cw_sjstcbl_xh=null;
	String cw_sjstcbl_fdmc=null;
	String cw_sjstcbl_qd=null;
	String cw_sjstcbl_zd=null;
	String cw_sjstcbl_tcbfb=null;
	String cw_sjstcbl_qdlx=null;
	String cw_sjstcbl_fgsbh=null;
	cw_sjstcbl_xh=request.getParameter("cw_sjstcbl_xh");
	if (cw_sjstcbl_xh!=null)
	{
		cw_sjstcbl_xh=cw_sjstcbl_xh.trim();
		if (!(cw_sjstcbl_xh.equals("")))	wheresql+=" and (cw_sjstcbl.xh="+cw_sjstcbl_xh+") ";
	}
	cw_sjstcbl_fdmc=request.getParameter("cw_sjstcbl_fdmc");
	if (cw_sjstcbl_fdmc!=null)
	{
		cw_sjstcbl_fdmc=cf.GB2Uni(cw_sjstcbl_fdmc);
		if (!(cw_sjstcbl_fdmc.equals("")))	wheresql+=" and  (cw_sjstcbl.fdmc='"+cw_sjstcbl_fdmc+"')";
	}
	cw_sjstcbl_qd=request.getParameter("cw_sjstcbl_qd");
	if (cw_sjstcbl_qd!=null)
	{
		cw_sjstcbl_qd=cw_sjstcbl_qd.trim();
		if (!(cw_sjstcbl_qd.equals("")))	wheresql+=" and  (cw_sjstcbl.qd="+cw_sjstcbl_qd+") ";
	}
	cw_sjstcbl_zd=request.getParameter("cw_sjstcbl_zd");
	if (cw_sjstcbl_zd!=null)
	{
		cw_sjstcbl_zd=cw_sjstcbl_zd.trim();
		if (!(cw_sjstcbl_zd.equals("")))	wheresql+=" and  (cw_sjstcbl.zd="+cw_sjstcbl_zd+") ";
	}
	cw_sjstcbl_tcbfb=request.getParameter("cw_sjstcbl_tcbfb");
	if (cw_sjstcbl_tcbfb!=null)
	{
		cw_sjstcbl_tcbfb=cw_sjstcbl_tcbfb.trim();
		if (!(cw_sjstcbl_tcbfb.equals("")))	wheresql+=" and  (cw_sjstcbl.tcbfb="+cw_sjstcbl_tcbfb+") ";
	}
	cw_sjstcbl_qdlx=request.getParameter("cw_sjstcbl_qdlx");
	if (cw_sjstcbl_qdlx!=null)
	{
		cw_sjstcbl_qdlx=cf.GB2Uni(cw_sjstcbl_qdlx);
		if (!(cw_sjstcbl_qdlx.equals("")))	wheresql+=" and  (cw_sjstcbl.qdlx='"+cw_sjstcbl_qdlx+"')";
	}
	cw_sjstcbl_fgsbh=request.getParameter("cw_sjstcbl_fgsbh");
	if (cw_sjstcbl_fgsbh!=null)
	{
		cw_sjstcbl_fgsbh=cf.GB2Uni(cw_sjstcbl_fgsbh);
		if (!(cw_sjstcbl_fgsbh.equals("")))	wheresql+=" and  (cw_sjstcbl.fgsbh='"+cw_sjstcbl_fgsbh+"')";
	}
	ls_sql="SELECT cw_sjstcbl.xh,cw_sjstcbl.fdmc,cw_sjstcbl.qd,cw_sjstcbl.zd,cw_sjstcbl.tcbfb, DECODE(cw_sjstcbl.qdlx,'1','���г�����װ','2','�г�����װ','3','��װ'),cw_sjstcbl.fgsbh,sq_dwxx.dwmc  ";
	ls_sql+=" FROM sq_dwxx,cw_sjstcbl  ";
    ls_sql+=" where cw_sjstcbl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by xh";
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_sjstcblList.jsp","SelectCw_sjstcbl.jsp","","EditCw_sjstcbl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","cw_sjstcbl_fdmc","cw_sjstcbl_qd","cw_sjstcbl_zd","cw_sjstcbl_tcbfb","cw_sjstcbl_qdlx","cw_sjstcbl_fgsbh","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_sjstcblList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from cw_sjstcbl where "+chooseitem;
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