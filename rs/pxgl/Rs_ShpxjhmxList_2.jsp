<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String jhbh=cf.GB2Uni(request.getParameter("pxjhbh"));
String jhmc=cf.GB2Uni(request.getParameter("pxjhmc"));
String shbh=cf.GB2Uni(request.getParameter("shbh"));

%>
<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String pxjhbh=null;
	pxjhbh=request.getParameter("pxjhbh");
	if (pxjhbh!=null)
	{
		pxjhbh=cf.GB2Uni(pxjhbh);
		if (!(pxjhbh.equals("")))	wheresql+=" and  (pxjhbh='"+pxjhbh+"')";
	}
	ls_sql="SELECT pxmxbh,DECODE(pxlx,'0','��ѵ','1','��ѵ') pxlx,rs_pxskxsbm.skxsmc skxs,rs_pxkclxbm.lxmc kclx,pxrs,pxfy,gcrs,zcrs,jcrs,pxkssj,pxjssj,pxjs,pxcd,lrr,lrsj,bz  ";
	ls_sql+=" FROM rs_pxjhmx,rs_pxskxsbm,rs_pxkclxbm  ";
    ls_sql+=" where rs_pxjhmx.skxs=rs_pxskxsbm.skxs and rs_pxjhmx.kclx=rs_pxkclxbm.kclx";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ShpxjhmxList.jsp","","","ViewRs_pxjhmx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
//	String[] disColName={"pxmxbh","pxlx","skxs","kclx","pxrs","pxfy","gcrs","zcrs","jcrs","pxkssj","pxjssj","pxjs","pxcd","lrr","lrsj","bz"};
//	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"pxmxbh"};
	pageObj.setKey(keyName);
//���ð�ť����
//	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
//	String[] buttonLink={"Rs_deleteJhmx.jsp?"};//��ť�������õ���ҳ���������Ӳ���
//	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
//	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
//	String[] pxmxbh = request.getParameterValues("pxmxbh");
//	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pxmxbh,"pxmxbh"));
//	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
//	{
//		String[] sql=new String[1];//Ҫִ�е�SQL
//		boolean needCommit=false;//����Ҫ������
//		sql[0]="delete from rs_pxjhmx where "+chooseitem;
//		pageObj.execDelete(sql,needCommit);
//	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <b><font size="3" color=black>��<%=jhmc%>:<%=jhbh%>��</font></b>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">��ѵ��ϸ���</td>
	<td  width="3%">��ѵ����</td>
	<td  width="3%">�ڿ���ʽ</td>
	<td  width="4%">�γ�����</td>
	<td  width="3%">��ѵ����</td>
	<td  width="3%">��ѵ����</td>
	<td  width="3%">�߲�����</td>
	<td  width="3%">�в�����</td>
	<td  width="3%">��������</td>
	<td  width="5%">�ƻ���ʼʱ��</td>
	<td  width="5%">�ƻ�����ʱ��</td>
	<td  width="5%">��ѵ��ʦ</td>
	<td  width="10%">��ѵ����</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="17%">��ע</td>
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