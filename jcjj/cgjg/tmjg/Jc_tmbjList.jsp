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
	String jc_tmbj_tmbm=null;
	String jc_tmbj_tmmc=null;
	String jc_tmbj_tmxlbm=null;
	String jc_tmbj_xh=null;
	String jc_tmbj_ymjg=null;
	String jc_tmbj_pmjg=null;
	String jc_tmbj_ppbm=null;
	jc_tmbj_tmbm=request.getParameter("jc_tmbj_tmbm");
	if (jc_tmbj_tmbm!=null)
	{
		jc_tmbj_tmbm=cf.GB2Uni(jc_tmbj_tmbm);
		if (!(jc_tmbj_tmbm.equals("")))	wheresql+=" and  (jc_tmbj.tmbm='"+jc_tmbj_tmbm+"')";
	}
	jc_tmbj_tmmc=request.getParameter("jc_tmbj_tmmc");
	if (jc_tmbj_tmmc!=null)
	{
		jc_tmbj_tmmc=cf.GB2Uni(jc_tmbj_tmmc);
		if (!(jc_tmbj_tmmc.equals("")))	wheresql+=" and  (jc_tmbj.tmmc='"+jc_tmbj_tmmc+"')";
	}
	jc_tmbj_tmxlbm=request.getParameter("jc_tmbj_tmxlbm");
	if (jc_tmbj_tmxlbm!=null)
	{
		jc_tmbj_tmxlbm=cf.GB2Uni(jc_tmbj_tmxlbm);
		if (!(jc_tmbj_tmxlbm.equals("")))	wheresql+=" and  (jc_tmbj.tmxlbm='"+jc_tmbj_tmxlbm+"')";
	}
	jc_tmbj_xh=request.getParameter("jc_tmbj_xh");
	if (jc_tmbj_xh!=null)
	{
		jc_tmbj_xh=cf.GB2Uni(jc_tmbj_xh);
		if (!(jc_tmbj_xh.equals("")))	wheresql+=" and  (jc_tmbj.xh='"+jc_tmbj_xh+"')";
	}
	jc_tmbj_ymjg=request.getParameter("jc_tmbj_ymjg");
	if (jc_tmbj_ymjg!=null)
	{
		jc_tmbj_ymjg=jc_tmbj_ymjg.trim();
		if (!(jc_tmbj_ymjg.equals("")))	wheresql+=" and  (jc_tmbj.ymjg="+jc_tmbj_ymjg+") ";
	}
	jc_tmbj_pmjg=request.getParameter("jc_tmbj_pmjg");
	if (jc_tmbj_pmjg!=null)
	{
		jc_tmbj_pmjg=jc_tmbj_pmjg.trim();
		if (!(jc_tmbj_pmjg.equals("")))	wheresql+=" and  (jc_tmbj.pmjg="+jc_tmbj_pmjg+") ";
	}
	jc_tmbj_ppbm=request.getParameter("jc_tmbj_ppbm");
	if (jc_tmbj_ppbm!=null)
	{
		jc_tmbj_ppbm=cf.GB2Uni(jc_tmbj_ppbm);
		if (!(jc_tmbj_ppbm.equals("")))	wheresql+=" and  (jc_tmbj.ppbm='"+jc_tmbj_ppbm+"')";
	}
	ls_sql="SELECT ppmc,tmxlmc,jc_tmbj.tmbm,jc_tmbj.tmmc,jc_tmbj.xh,jc_tmbj.ymjg,jc_tmbj.pmjg,jc_tmbj.zp,jc_tmbj.bz  ";
	ls_sql+=" FROM jc_tmbj,jdm_tmxlbm,jdm_ppbm  ";
    ls_sql+=" where jc_tmbj.tmxlbm=jdm_tmxlbm.tmxlbm and jc_tmbj.ppbm=jdm_ppbm.ppbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_tmbj.ppbm,jc_tmbj.tmxlbm,jc_tmbj.tmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_tmbjList.jsp","SelectJc_tmbj.jsp","","EditJc_tmbj.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"tmbm","jc_tmbj_tmmc","jdm_tmxlbm_tmxlmc","jc_tmbj_xh","jc_tmbj_ymjg","jc_tmbj_pmjg","sq_dwxx_dwmc","jc_tmbj_zp","jc_tmbj_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"tmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_tmbjList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ppmc","1");//�в����������Hash��
	spanColHash.put("tmxlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] tmbm = request.getParameterValues("tmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(tmbm,"tmbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_tmbj where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="9%">Ʒ��</td>
	<td  width="16%">̨��ϵ��</td>
	<td  width="9%">̨�����</td>
	<td  width="11%">̨������</td>
	<td  width="9%">�ͺ�</td>
	<td  width="9%">���׼۸�</td>
	<td  width="9%">ƽ�׼۸�</td>
	<td  width="13%">��Ƭ</td>
	<td  width="7%">��ע</td>
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