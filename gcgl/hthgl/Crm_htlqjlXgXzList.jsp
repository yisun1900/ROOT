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
	String crm_htlqjl_lqjlh=null;
	String crm_htlqjl_lqsl=null;
	String crm_htlqjl_sysl=null;
	String crm_htlqjl_zfsl=null;
	String crm_htlqjl_dwbh=null;
	String crm_htlqjl_fgsbh=null;
	String crm_htlqjl_lqr=null;
	String crm_htlqjl_lqsj=null;
	String crm_htlqjl_qshth=null;
	String crm_htlqjl_zzhth=null;
	String crm_htlqjl_xzbz=null;
	String crm_htlqjl_xzr=null;
	String crm_htlqjl_xzsj=null;
	String crm_htlqjl_lrr=null;
	String crm_htlqjl_lrsj=null;
	crm_htlqjl_lqjlh=request.getParameter("crm_htlqjl_lqjlh");
	if (crm_htlqjl_lqjlh!=null)
	{
		crm_htlqjl_lqjlh=cf.GB2Uni(crm_htlqjl_lqjlh);
		if (!(crm_htlqjl_lqjlh.equals("")))	wheresql+=" and  (crm_htlqjl.lqjlh='"+crm_htlqjl_lqjlh+"')";
	}
	crm_htlqjl_lqsl=request.getParameter("crm_htlqjl_lqsl");
	if (crm_htlqjl_lqsl!=null)
	{
		crm_htlqjl_lqsl=crm_htlqjl_lqsl.trim();
		if (!(crm_htlqjl_lqsl.equals("")))	wheresql+=" and (crm_htlqjl.lqsl="+crm_htlqjl_lqsl+") ";
	}
	crm_htlqjl_sysl=request.getParameter("crm_htlqjl_sysl");
	if (crm_htlqjl_sysl!=null)
	{
		crm_htlqjl_sysl=crm_htlqjl_sysl.trim();
		if (!(crm_htlqjl_sysl.equals("")))	wheresql+=" and (crm_htlqjl.sysl="+crm_htlqjl_sysl+") ";
	}
	crm_htlqjl_zfsl=request.getParameter("crm_htlqjl_zfsl");
	if (crm_htlqjl_zfsl!=null)
	{
		crm_htlqjl_zfsl=crm_htlqjl_zfsl.trim();
		if (!(crm_htlqjl_zfsl.equals("")))	wheresql+=" and (crm_htlqjl.zfsl="+crm_htlqjl_zfsl+") ";
	}
	crm_htlqjl_dwbh=request.getParameter("crm_htlqjl_dwbh");
	if (crm_htlqjl_dwbh!=null)
	{
		crm_htlqjl_dwbh=cf.GB2Uni(crm_htlqjl_dwbh);
		if (!(crm_htlqjl_dwbh.equals("")))	wheresql+=" and  (crm_htlqjl.dwbh='"+crm_htlqjl_dwbh+"')";
	}
	crm_htlqjl_fgsbh=request.getParameter("crm_htlqjl_fgsbh");
	if (crm_htlqjl_fgsbh!=null)
	{
		crm_htlqjl_fgsbh=cf.GB2Uni(crm_htlqjl_fgsbh);
		if (!(crm_htlqjl_fgsbh.equals("")))	wheresql+=" and  (crm_htlqjl.fgsbh='"+crm_htlqjl_fgsbh+"')";
	}
	crm_htlqjl_lqr=request.getParameter("crm_htlqjl_lqr");
	if (crm_htlqjl_lqr!=null)
	{
		crm_htlqjl_lqr=cf.GB2Uni(crm_htlqjl_lqr);
		if (!(crm_htlqjl_lqr.equals("")))	wheresql+=" and  (crm_htlqjl.lqr='"+crm_htlqjl_lqr+"')";
	}
	crm_htlqjl_lqsj=request.getParameter("crm_htlqjl_lqsj");
	if (crm_htlqjl_lqsj!=null)
	{
		crm_htlqjl_lqsj=crm_htlqjl_lqsj.trim();
		if (!(crm_htlqjl_lqsj.equals("")))	wheresql+="  and (crm_htlqjl.lqsj>=TO_DATE('"+crm_htlqjl_lqsj+"','YYYY/MM/DD'))";
	}
	crm_htlqjl_lqsj=request.getParameter("crm_htlqjl_lqsj2");
	if (crm_htlqjl_lqsj!=null)
	{
		crm_htlqjl_lqsj=crm_htlqjl_lqsj.trim();
		if (!(crm_htlqjl_lqsj.equals("")))	wheresql+="  and (crm_htlqjl.lqsj<=TO_DATE('"+crm_htlqjl_lqsj+"','YYYY/MM/DD'))";
	}
	crm_htlqjl_qshth=request.getParameter("crm_htlqjl_qshth");
	if (crm_htlqjl_qshth!=null)
	{
		crm_htlqjl_qshth=cf.GB2Uni(crm_htlqjl_qshth);
		if (!(crm_htlqjl_qshth.equals("")))	wheresql+=" and  (crm_htlqjl.qshth='"+crm_htlqjl_qshth+"')";
	}
	crm_htlqjl_zzhth=request.getParameter("crm_htlqjl_zzhth");
	if (crm_htlqjl_zzhth!=null)
	{
		crm_htlqjl_zzhth=cf.GB2Uni(crm_htlqjl_zzhth);
		if (!(crm_htlqjl_zzhth.equals("")))	wheresql+=" and  (crm_htlqjl.zzhth='"+crm_htlqjl_zzhth+"')";
	}
	crm_htlqjl_xzbz=request.getParameter("crm_htlqjl_xzbz");
	if (crm_htlqjl_xzbz!=null)
	{
		crm_htlqjl_xzbz=cf.GB2Uni(crm_htlqjl_xzbz);
		if (!(crm_htlqjl_xzbz.equals("")))	wheresql+=" and  (crm_htlqjl.xzbz='"+crm_htlqjl_xzbz+"')";
	}
	crm_htlqjl_xzr=request.getParameter("crm_htlqjl_xzr");
	if (crm_htlqjl_xzr!=null)
	{
		crm_htlqjl_xzr=cf.GB2Uni(crm_htlqjl_xzr);
		if (!(crm_htlqjl_xzr.equals("")))	wheresql+=" and  (crm_htlqjl.xzr='"+crm_htlqjl_xzr+"')";
	}
	crm_htlqjl_xzsj=request.getParameter("crm_htlqjl_xzsj");
	if (crm_htlqjl_xzsj!=null)
	{
		crm_htlqjl_xzsj=crm_htlqjl_xzsj.trim();
		if (!(crm_htlqjl_xzsj.equals("")))	wheresql+="  and (crm_htlqjl.xzsj>=TO_DATE('"+crm_htlqjl_xzsj+"','YYYY/MM/DD'))";
	}
	crm_htlqjl_xzsj=request.getParameter("crm_htlqjl_xzsj2");
	if (crm_htlqjl_xzsj!=null)
	{
		crm_htlqjl_xzsj=crm_htlqjl_xzsj.trim();
		if (!(crm_htlqjl_xzsj.equals("")))	wheresql+="  and (crm_htlqjl.xzsj<=TO_DATE('"+crm_htlqjl_xzsj+"','YYYY/MM/DD'))";
	}
	crm_htlqjl_lrr=request.getParameter("crm_htlqjl_lrr");
	if (crm_htlqjl_lrr!=null)
	{
		crm_htlqjl_lrr=cf.GB2Uni(crm_htlqjl_lrr);
		if (!(crm_htlqjl_lrr.equals("")))	wheresql+=" and  (crm_htlqjl.lrr='"+crm_htlqjl_lrr+"')";
	}
	crm_htlqjl_lrsj=request.getParameter("crm_htlqjl_lrsj");
	if (crm_htlqjl_lrsj!=null)
	{
		crm_htlqjl_lrsj=crm_htlqjl_lrsj.trim();
		if (!(crm_htlqjl_lrsj.equals("")))	wheresql+="  and (crm_htlqjl.lrsj>=TO_DATE('"+crm_htlqjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_htlqjl_lrsj=request.getParameter("crm_htlqjl_lrsj2");
	if (crm_htlqjl_lrsj!=null)
	{
		crm_htlqjl_lrsj=crm_htlqjl_lrsj.trim();
		if (!(crm_htlqjl_lrsj.equals("")))	wheresql+="  and (crm_htlqjl.lrsj<=TO_DATE('"+crm_htlqjl_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_htlqjl.lqjlh, DECODE(crm_htlqjl.xzbz,'N','δ����','Y','����'),crm_htlqjl.lqsl,crm_htlqjl.sysl,crm_htlqjl.zfsl,crm_htlqjl.lqr,crm_htlqjl.lqsj,crm_htlqjl.qshth,crm_htlqjl.zzhth,a.dwmc dwbh,b.dwmc fgsbh,crm_htlqjl.xzr,crm_htlqjl.xzsj,crm_htlqjl.bz,crm_htlqjl.lrr,crm_htlqjl.lrsj  ";
	ls_sql+=" FROM crm_htlqjl,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where crm_htlqjl.dwbh=a.dwbh(+) and crm_htlqjl.fgsbh=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_htlqjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_htlqjlXzList.jsp","SelectXzCrm_htlqjl.jsp","","XzCrm_htlqjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"lqjlh","crm_htlqjl_lqsl","crm_htlqjl_sysl","crm_htlqjl_zfsl","sq_dwxx_dwmc","crm_htlqjl_fgsbh","crm_htlqjl_lqr","crm_htlqjl_lqsj","crm_htlqjl_qshth","crm_htlqjl_zzhth","crm_htlqjl_xzbz","crm_htlqjl_xzr","crm_htlqjl_xzsj","crm_htlqjl_bz","crm_htlqjl_lrr","crm_htlqjl_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"lqjlh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ��������Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Crm_htlqjlXgXzList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] lqjlh = request.getParameterValues("lqjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(lqjlh,"lqjlh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from crm_htlqjl where "+chooseitem;
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
  <B><font size="3">��ͬ���ˣ�ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">��ȡ��¼��</td>
	<td  width="4%">���˱�־</td>
	<td  width="4%">��ȡ����</td>
	<td  width="4%">ʹ������</td>
	<td  width="4%">��������</td>
	<td  width="4%">��ȡ��</td>
	<td  width="5%">��ȡʱ��</td>
	<td  width="7%">��ʼ��ͬ��</td>
	<td  width="7%">��ֹ��ͬ��</td>
	<td  width="8%">��ȡ����</td>
	<td  width="7%">��ȡ�ֹ�˾</td>
	<td  width="4%">������</td>
	<td  width="5%">����ʱ��</td>
	<td  width="19%">��ע</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
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