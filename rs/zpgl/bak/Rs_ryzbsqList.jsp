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
	String sqbh=null;
	String zbye=null;
	String zbzw=null;
	String fgs=null;
	String dwbh=null;
	String zbly=null;
	String zbqt=null;
	String xwdgsj=null;
	String xb=null;
	String hy=null;
	String nl=null;
	String xl=null;
	String zy=null;
	String wy=null;
	String jsjjn=null;
	String gzjy=null;
	String gx=null;
	String jn=null;
	String qt=null;
	String jhzt=null;
	String lrr=null;
	String ssfgs=null;
	String lrsj=null;
	sqbh=request.getParameter("sqbh");
	if (sqbh!=null)
	{
		sqbh=cf.GB2Uni(sqbh);
		if (!(sqbh.equals("")))	wheresql+=" and  (sqbh='"+sqbh+"')";
	}
	zbye=request.getParameter("zbye");
	if (zbye!=null)
	{
		zbye=zbye.trim();
		if (!(zbye.equals("")))	wheresql+=" and (zbye="+zbye+") ";
	}
	zbzw=request.getParameter("zbzw");
	if (zbzw!=null)
	{
		zbzw=cf.GB2Uni(zbzw);
		if (!(zbzw.equals("")))	wheresql+=" and  (zbzw='"+zbzw+"')";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (rs_ryzbsq.fgs='"+fgs+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (rs_ryzbsq.dwbh='"+dwbh+"')";
	}
	zbly=request.getParameter("zbly");
	if (zbly!=null)
	{
		zbly=cf.GB2Uni(zbly);
		if (!(zbly.equals("")))	wheresql+=" and  (zbly='"+zbly+"')";
	}
	zbqt=request.getParameter("zbqt");
	if (zbqt!=null)
	{
		zbqt=cf.GB2Uni(zbqt);
		if (!(zbqt.equals("")))	wheresql+=" and  (zbqt='"+zbqt+"')";
	}
	xwdgsj=request.getParameter("xwdgsj");
	if (xwdgsj!=null)
	{
		xwdgsj=xwdgsj.trim();
		if (!(xwdgsj.equals("")))	wheresql+="  and (xwdgsj>=TO_DATE('"+xwdgsj+"','YYYY/MM/DD'))";
	}
	xwdgsj=request.getParameter("xwdgsj2");
	if (xwdgsj!=null)
	{
		xwdgsj=xwdgsj.trim();
		if (!(xwdgsj.equals("")))	wheresql+="  and (xwdgsj<=TO_DATE('"+xwdgsj+"','YYYY/MM/DD'))";
	}
	xb=request.getParameter("xb");
	if (xb!=null)
	{
		xb=cf.GB2Uni(xb);
		if (!(xb.equals("")))	wheresql+=" and  (xb='"+xb+"')";
	}
	hy=request.getParameter("hy");
	if (hy!=null)
	{
		hy=cf.GB2Uni(hy);
		if (!(hy.equals("")))	wheresql+=" and  (hy='"+hy+"')";
	}
	nl=request.getParameter("nl");
	if (nl!=null)
	{
		nl=cf.GB2Uni(nl);
		if (!(nl.equals("")))	wheresql+=" and  (nl='"+nl+"')";
	}
	xl=request.getParameter("xl");
	if (xl!=null)
	{
		xl=cf.GB2Uni(xl);
		if (!(xl.equals("")))	wheresql+=" and  (xl='"+xl+"')";
	}
	zy=request.getParameter("zy");
	if (zy!=null)
	{
		zy=cf.GB2Uni(zy);
		if (!(zy.equals("")))	wheresql+=" and  (zy='"+zy+"')";
	}
	wy=request.getParameter("wy");
	if (wy!=null)
	{
		wy=cf.GB2Uni(wy);
		if (!(wy.equals("")))	wheresql+=" and  (wy='"+wy+"')";
	}
	jsjjn=request.getParameter("jsjjn");
	if (jsjjn!=null)
	{
		jsjjn=cf.GB2Uni(jsjjn);
		if (!(jsjjn.equals("")))	wheresql+=" and  (jsjjn='"+jsjjn+"')";
	}
	gzjy=request.getParameter("gzjy");
	if (gzjy!=null)
	{
		gzjy=cf.GB2Uni(gzjy);
		if (!(gzjy.equals("")))	wheresql+=" and  (gzjy='"+gzjy+"')";
	}
	gx=request.getParameter("gx");
	if (gx!=null)
	{
		gx=cf.GB2Uni(gx);
		if (!(gx.equals("")))	wheresql+=" and  (gx='"+gx+"')";
	}
	jn=request.getParameter("jn");
	if (jn!=null)
	{
		jn=cf.GB2Uni(jn);
		if (!(jn.equals("")))	wheresql+=" and  (jn='"+jn+"')";
	}
	qt=request.getParameter("qt");
	if (qt!=null)
	{
		qt=cf.GB2Uni(qt);
		if (!(qt.equals("")))	wheresql+=" and  (qt='"+qt+"')";
	}
	jhzt=request.getParameter("jhzt");
	if (jhzt!=null)
	{
		jhzt=cf.GB2Uni(jhzt);
		if (!(jhzt.equals("")))	wheresql+=" and  (jhzt='"+jhzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_ryzbsq.ssfgs='"+ssfgs+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT sqbh,zbye,dm_xzzwbm.xzzwmc zbzw,a.dwmc fgs,b.dwmc dwbh, DECODE(zbly,'1','ȱԱ����','2','�������','3','��������','4','����'),zbqt,xwdgsj,DECODE(jhzt,'1','�ȴ�����','2','����������','3','��Ƹ���','4','����δͨ��','5','�޸ļƻ�','6','������'),lrr,c.dwmc ssfgs,lrsj  ";
	ls_sql+=" FROM rs_ryzbsq,sq_dwxx a,sq_dwxx b ,dm_xzzwbm,sq_dwxx c ";
    ls_sql+=" where  a.dwbh=rs_ryzbsq.fgs and b.dwbh=rs_ryzbsq.dwbh and dm_xzzwbm.xzzwbm=rs_ryzbsq.zbzw and c.dwbh=rs_ryzbsq.ssfgs ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ryzbsqList.jsp","SelectRs_ryzbsq.jsp","","EditRs_ryzbsq.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqbh","zbye","zbzw","fgs","dwbh","zbly","zbqt","xwdgsj","xb","hy","nl","xl","zy","wy","jsjjn","gzjy","gx","jn","qt","jhzt","lrr","ssfgs","lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sqbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_ryzbsqList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] sqbh = request.getParameterValues("sqbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(sqbh,"sqbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from rs_ryzbsq where "+chooseitem;
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="7%">������</td>
	<td  width="6%">����Ա��</td>
	<td  width="7%">����ְ��</td>
	<td  width="9%">�����ֹ�˾</td>
	<td  width="8%">���벿��</td>
	<td  width="6%">��������</td>
	<td  width="9%">��������</td>
	<td  width="9%">ϣ������ʱ��</td>
	<td  width="7%">����״̬</td>
	<td  width="7%">¼����</td>
	<td  width="10%">¼���˷ֹ�˾</td>
	<td  width="8%">¼��ʱ��</td>
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